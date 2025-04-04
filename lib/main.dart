import 'package:flutter/material.dart';
import 'learningpage/module1/m1_main.dart';
import 'learningpage/module2/m2_main.dart';
import 'learningpage/module3/m3_main.dart';
import 'posttest/posttestintro.dart';
import 'component/appbar.dart';
import 'component/drawer.dart';
import 'style/transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climate Change',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Climate Change App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<Offset>> _offsetAnimations;
  late List<Animation<double>> _fadeAnimations;

  // Track locked/unlocked status for each module
  List<bool> moduleLockedStatus = [false, true, true, true]; // Module 1 unlocked, others locked

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create staggered animations for each card
    _offsetAnimations = List.generate(4, (index) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.1,
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    // Create fade animations for each card
    _fadeAnimations = List.generate(4, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.1,
            1.0,
            curve: Curves.easeIn,
          ),
        ),
      );
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        widget.title,
        context,
      ),
      drawer: buildDrawer(
        context,
        moduleLockedStatus,
        (updatedStatus) {
          setState(() {
            moduleLockedStatus = updatedStatus; // Update the lock status
          });
        },
      ),
      body: SafeArea(
        child: Scrollbar( // Add Scrollbar here
          thumbVisibility: true, // Makes the scrollbar always visible
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1 / 1,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final modules = [
                {
                  'title': 'Module 1',
                  'subtitle': 'Introduction to Climate Change',
                  'description': 'มาทำความรู้จักและทำไมต้องรู้กับการเปลี่ยนแปลงสภาพภูมิอากาศ',
                  'screen': Module1Screen(),
                },
                {
                  'title': 'Module 2',
                  'subtitle': 'Effects of Climate Change',
                  'description': 'ผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ',
                  'screen': Module2Screen(),
                },
                {
                  'title': 'Module 3',
                  'subtitle': 'Fix The Problem And Stop The Cause',
                  'description': 'การแก้ปัญหาและปรับตัวเพื่อโลกของเรา',
                  'screen': Module3Screen(),
                },
                {
                  'title': 'Post Test',
                  'subtitle': 'ทดสอบหลังเรียน',
                  'description': 'ทดสอบหลังจากผ่านบทเรียนทั้งหมดแล้ว',
                  'screen': PostTestIntroduction(),
                },
              ];

              final module = modules[index];
              final isLocked = moduleLockedStatus[index];

              return FadeTransition(
                opacity: _fadeAnimations[index],
                child: SlideTransition(
                  position: _offsetAnimations[index],
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: isLocked
                                ? null
                                : () {
                                    Navigator.push(
                                      context,
                                      createCustomRoute(module['screen'] as Widget),
                                    );
                                  },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isLocked
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    module['title'] as String,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  if (isLocked)
                                    const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                          title: Text(
                            module['title'] as String,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(module['subtitle'] as String),
                              Text(module['description'] as String),
                            ],
                          ),
                          trailing: Icon(
                            isLocked ? Icons.lock : Icons.lock_open,
                            color: isLocked ? Colors.red : Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
