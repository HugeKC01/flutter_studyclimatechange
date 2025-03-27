import 'package:climatechange/main.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Module2Screen extends StatelessWidget {
  const Module2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 1: Introduction to Climate Change'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Climate Change App')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_rounded),
              title: Text('Manual'),
              onTap: () {
                // Handle the manual tap here
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Content for Module 1'),
      ),
    );
  }
}