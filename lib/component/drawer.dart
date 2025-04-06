import 'package:climatechange/main.dart';
import 'package:flutter/material.dart';
import 'package:climatechange/admin.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
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
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Admin'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminScreen(),
              ),
            );
          },
        ),
      ],
    ),
  );
}