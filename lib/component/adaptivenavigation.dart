import 'package:climatechange/main.dart';
import 'package:flutter/material.dart';
import 'package:climatechange/manual_page.dart'; // Ensure this is the correct path to ManualPage
import 'package:climatechange/component/appbar.dart';

class AdaptiveNavigation extends StatelessWidget {
  final Widget child;
  final String title;

  const AdaptiveNavigation({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 500) {
          // Use NavigationRail for large screens
          return Scaffold(
            appBar: buildAppBar(
              title, // Title for the AppBar
              context,
            ),
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: 0, // Default selected index
                  onDestinationSelected: (int index) {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManualPage(),
                        ),
                      );
                    }
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_rounded),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.book_rounded),
                      label: Text('Manual'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: child, // The main content of the page
                ),
              ],
            ),
          );
        } else {
          // Use NavigationDrawer for smaller screens
          return Scaffold(
            appBar: buildAppBar(
              title,
              context, // Title for the AppBar
            ),
            drawer: NavigationDrawer(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_rounded),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book_rounded),
                  title: const Text('Manual'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManualPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: child, // The main content of the page
          );
        }
      },
    );
  }
}