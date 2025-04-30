import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/shared_state.dart'; // Import the shared ValueNotifier

// Example module titles from main.dart
const List<String> moduleTitles = [
  'Introduction to Climate Change',
  'Effects of Climate Change',
  'Fix The Problem And Stop The Cause',
  'Post Test',
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = 'johndoe123'; // Default username
  String _name = 'John Doe'; // Default name

  @override
  void initState() {
    super.initState();
    _loadProfileData(); // Load the saved profile data from SharedPreferences
    _loadDarkModeSetting(); // Load the saved dark mode setting
  }

  // Load profile data (name and username) from SharedPreferences
  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'johndoe123'; // Default to 'johndoe123' if not set
      _name = prefs.getString('name') ?? 'John Doe'; // Default to 'John Doe' if not set
    });
  }

  // Save profile data (name and username) to SharedPreferences
  Future<void> _saveProfileData(String name, String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('name', name);
  }

  // Reset lock status to defaults
  Future<void> _resetLockStatus() async {
    final prefs = await SharedPreferences.getInstance();
    const defaultStatus = [false, true, true, true]; // Default lock status for all modules
    await prefs.setStringList(
      'moduleLockedStatus',
      defaultStatus.map((status) => status.toString()).toList(),
    );
    setState(() {
      moduleLockedStatusNotifier.value = List.from(defaultStatus); // Update the ValueNotifier
    });
  }

  // Show edit profile dialog
  void _showEditProfileDialog() {
    final TextEditingController usernameController = TextEditingController(text: _username);
    final TextEditingController nameController = TextEditingController(text: _name);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final newName = nameController.text.trim();
                final newUsername = usernameController.text.trim();
                if (newName.isNotEmpty && newUsername.isNotEmpty) {
                  setState(() {
                    _name = newName; // Update the name in the UI
                    _username = newUsername; // Update the username in the UI
                  });
                  _saveProfileData(newName, newUsername); // Save the updated profile data
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Load dark mode setting from SharedPreferences
  Future<void> _loadDarkModeSetting() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false; // Default to false (light mode)
    darkModeNotifier.value = isDarkMode; // Update the shared ValueNotifier
  }

  // Save dark mode setting to SharedPreferences
  Future<void> _saveDarkModeSetting(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  // Toggle dark mode
  void _toggleDarkMode(bool value) {
    darkModeNotifier.value = value; // Update the shared ValueNotifier
    _saveDarkModeSetting(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkModeNotifier, // Listen to the shared ValueNotifier
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: _showEditProfileDialog, // Open the edit profile dialog
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        _name, // Display the name
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        _username, // Display the username
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: isDarkMode,
                      onChanged: _toggleDarkMode, // Toggle dark mode
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Study Module Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ValueListenableBuilder<List<bool>>(
                        valueListenable: moduleLockedStatusNotifier, // Listen to the shared ValueNotifier
                        builder: (context, lockedStatus, child) {
                          return ListView.builder(
                            itemCount: lockedStatus.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(moduleTitles[index]), // Use module title from the list
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      lockedStatus[index] ? 'Locked' : 'Unlocked',
                                      style: TextStyle(
                                        color: lockedStatus[index] ? Colors.red : Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8), // Add spacing between text and icon
                                    Icon(
                                      lockedStatus[index] ? Icons.lock : Icons.lock_open,
                                      color: lockedStatus[index] ? Colors.red : Colors.green,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _resetLockStatus, // Reset lock status to defaults
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Reset Lock Status'),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}