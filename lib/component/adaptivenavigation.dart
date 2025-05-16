import 'package:climatechange/main.dart';
import 'package:flutter/material.dart';
import 'package:climatechange/manual_page.dart'; // Ensure this is the correct path to ManualPage
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/minigame_main.dart'; // Import MinigameMain

class AdaptiveNavigation extends StatelessWidget {
  final Widget child;
  final String title;
  final int selectedIndex; // Add selectedIndex

  const AdaptiveNavigation({super.key, required this.child, required this.title, required this.selectedIndex});

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
                  selectedIndex: selectedIndex, // Use selectedIndex
                  onDestinationSelected: (int index) {
                    if (index == selectedIndex) return; // Prevent pushing same page
                    if (index == 0) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManualPage(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MinigameScreen(),
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
                    NavigationRailDestination(
                      icon: Icon(Icons.videogame_asset_rounded),
                      label: Text('Minigame'),
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
                  selected: selectedIndex == 0, // Highlight if selected
                  onTap: () {
                    if (selectedIndex == 0) return;
                    Navigator.pushReplacement(
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
                  selected: selectedIndex == 1, // Highlight if selected
                  onTap: () {
                    if (selectedIndex == 1) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManualPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.videogame_asset_rounded),
                  title: const Text('Minigame'),
                  selected: selectedIndex == 2, // Highlight if selected
                  onTap: () {
                    if (selectedIndex == 2) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MinigameScreen(),
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