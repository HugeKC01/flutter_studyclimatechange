import 'package:climatechange/main.dart';
import 'package:flutter/material.dart';

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
      ],
    ),
  );
}