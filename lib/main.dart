import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue, // Set the background color
              child: IconButton(
              icon: const Icon(Icons.person, color: Colors.white), // Set the icon and its color
              onPressed: () {
                // Handle the button press here
              },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
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
                // Handle the manual tap here
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cover Section',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text('Module 1'),
                subtitle: Text('Introduction to Climate Change'),
                trailing: Icon(Icons.lock),
              ),
            ),
          ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cover Section',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text('Module 2'),
                subtitle: Text('Effects of Climate Change'),
                trailing: Icon(Icons.lock),
              ),
            ),
          ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cover Section',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text('Module 3'),
                subtitle: Text('Mitigation and Adaptation Strategies'),
                trailing: Icon(Icons.lock),
              ),
            ),
          ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cover Section',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text('Post Test'),
                subtitle: Text('Post Test'),
                trailing: Icon(Icons.lock),
              ),
            ),
          ],
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
