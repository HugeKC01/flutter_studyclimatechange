import 'package:flutter/material.dart';
import 'learningpage/module1/m1_main.dart';
import 'learningpage/module2/m2_main.dart';
import 'learningpage/module3/m3_main.dart';
import 'posttest/posttestintro.dart';

void main() {
  runApp(const MyApp());
}

// Reusable AppBar Widget
PreferredSizeWidget buildAppBar(String title, BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(title),
    elevation: 5.0,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Handle the button press here
            },
          ),
        ),
      ),
    ],
  );
}

// Reusable Drawer Widget
Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home_rounded),
          title: Text('Home'),
          onTap: () {
            // Handle the home tap here
          },
        ),
        ListTile(
          leading: Icon(Icons.book_rounded),
          title: Text('Manual'),
          onTap: () {
            // Handle the manual tap here
          },
        ),
        ListTile(
          leading: Icon(Icons.help_rounded),
          title: Text('Help'),
          onTap: () {
            // Handle the help tap here
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // Handle the settings tap here
          },
        ),
      ],
    ),
  );
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
        begin: const Offset(0, 0.3), // Start slightly below the screen
        end: Offset.zero, // End at the original position
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.1, // Stagger each card by 10%
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    // Create fade animations for each card
    _fadeAnimations = List.generate(4, (index) {
      return Tween<double>(
        begin: 0.0, // Start fully transparent
        end: 1.0, // End fully visible
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.1, // Stagger each card by 10%
            1.0,
            curve: Curves.easeIn,
          ),
        ),
      );
    });

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        elevation: 5.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Handle the button press here
                },
              ),
            ),
          ),
        ],
      ),
      drawer: buildDrawer(context),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2, // 1 column on mobile, 2 on larger screens
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1 / 1, // Adjust the aspect ratio as needed
          ),
          itemCount: 4, // Number of items (modules + post-test)
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => module['screen'] as Widget,
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              module['title'] as String,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  trailing: Icon(Icons.lock),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => module['screen'] as Widget,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
