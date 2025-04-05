import 'package:flutter/material.dart';
import 'learningpage/module1/m1_main.dart';
import 'learningpage/module2/m2_main.dart';
import 'learningpage/module3/m3_main.dart';
import 'posttest/posttest.dart';

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

class _MyHomePageState extends State<MyHomePage> {
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
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2, // 1 column on mobile, 2 on larger screens
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3 / 2, // Adjust the aspect ratio as needed
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
              'screen': PostTestScreen(),
            },
          ];

          final module = modules[index];

          return Card(
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    title: Text(module['subtitle'] as String),
                    subtitle: Text(module['description'] as String),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
