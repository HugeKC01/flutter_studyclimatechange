// Reusable AppBar Widget
import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(String title, BuildContext context) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Navigate to a profile screen or show a dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Profile'),
                    content: const Text('This is the profile section.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    ],
  );
}