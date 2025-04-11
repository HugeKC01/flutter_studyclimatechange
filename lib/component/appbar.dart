// Reusable AppBar Widget
import 'package:flutter/material.dart';
import 'package:climatechange/profile.dart';

PreferredSizeWidget buildAppBar(String title, BuildContext context, {Widget? leading}) {
  return AppBar(
    title: Text(title),
    leading: leading,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Handle profile icon tap here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}