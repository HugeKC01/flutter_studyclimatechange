import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'learningpage/module1/m1_main.dart';
import 'learningpage/module2/m2_main.dart';
import 'learningpage/module3/m3_main.dart';
import 'posttest/posttestintro.dart';
import 'component/appbar.dart';
import 'component/drawer.dart';
import 'component/shared_state.dart'; // Import the shared ValueNotifier

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadLockStatus(); // Load lock status before running the app
  runApp(const MyApp());
}

// Load lock status from SharedPreferences
Future<void> _loadLockStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String>? savedStatus = prefs.getStringList('moduleLockedStatus');

  if (savedStatus != null) {
    moduleLockedStatusNotifier.value = savedStatus.map((status) => status == 'true').toList();
  }
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
    final modules = [
      {
        'title': 'Module 1',
        'subtitle': 'Introduction to Climate Change',
        'description': 'มาทำความรู้จักและทำไมต้องรู้กับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': Module1Screen(),
      },
      {
        'title': 'Module 2',
        'subtitle': 'Cause and effects of the Climate Change',
        'description': 'สาเหตุและผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': Module2Screen(),
      },
      {
        'title': 'Module 3',
        'subtitle': 'Fix The Problem And Adaptation for the Climate Change',
        'description': 'วิธีการแก้ปัญหาและการปรับตัวกับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': Module3Screen(),
      },
      {
        'title': 'Post Test',
        'subtitle': 'ทดสอบหลังเรียน',
        'description': 'ทดสอบหลังจากผ่านบทเรียนทั้งหมดแล้ว',
        'screen': PostTestIntroduction(),
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        widget.title,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Stack(
        children: [
          Positioned.fill(
        child: Opacity(
          opacity: 0.15, // Adjust the opacity value as needed
          child: Image.asset(
            'asset/overall/background1.png', // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
          ),
          SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          child: ValueListenableBuilder<List<bool>>(
            valueListenable: moduleLockedStatusNotifier, // Listen to the shared ValueNotifier
            builder: (context, lockedStatus, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  final isLocked = lockedStatus[index];

                  return FadeTransition(
                    opacity: _fadeAnimations[index],
                    child: SlideTransition(
                      position: _offsetAnimations[index],
                      child: GestureDetector(
                        onTap: isLocked
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => module['screen'] as Widget,
                                  ),
                                );
                              },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5.0,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: isLocked
                                        ? Colors.grey
                                        : Theme.of(context).colorScheme.primary,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        module['title'] as String,
                                        style: const TextStyle(
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
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                                title: Text(
                                  module['title'] as String,
                                  style: const TextStyle(
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
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
        ],
      ),
    );
  }
}
