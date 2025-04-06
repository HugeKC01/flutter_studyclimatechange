import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/shared_state.dart'; // Import the shared state

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _loadLockStatus(); // Load lock status from SharedPreferences
  }

  // Load lock status from SharedPreferences
  Future<void> _loadLockStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedStatus = prefs.getStringList('moduleLockedStatus');

    if (savedStatus != null) {
      moduleLockedStatusNotifier.value = savedStatus.map((status) => status == 'true').toList();
    }
    setState(() {
      _isLoading = false; // Loading complete
    });
  }

  // Save lock status to SharedPreferences
  Future<void> _saveLockStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> statusToSave = moduleLockedStatusNotifier.value.map((status) => status.toString()).toList();
    await prefs.setStringList('moduleLockedStatus', statusToSave);
  }

  // Reset lock status to default values
  Future<void> _resetLockStatus() async {
    moduleLockedStatusNotifier.value = [false, true, true, true]; // Default values
    await _saveLockStatus(); // Save the reset status to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Show a loading indicator while data is being loaded
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              // Confirm reset action
              final shouldReset = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Reset Lock Status'),
                  content: const Text('Are you sure you want to reset all modules to their default lock status?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false), // Cancel
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true), // Confirm
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              );

              if (shouldReset == true) {
                await _resetLockStatus(); // Reset lock status
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<bool>>(
        valueListenable: moduleLockedStatusNotifier, // Listen to the shared ValueNotifier
        builder: (context, lockedStatus, child) {
          return ListView.builder(
            itemCount: lockedStatus.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Module ${index + 1}'),
                subtitle: Text(lockedStatus[index] ? 'Locked' : 'Unlocked'),
                trailing: Switch(
                  value: !lockedStatus[index], // Invert for lock/unlock
                  onChanged: (value) {
                    lockedStatus[index] = !value; // Update lock status
                    moduleLockedStatusNotifier.value = List.from(lockedStatus); // Notify listeners
                    _saveLockStatus(); // Save the updated status to SharedPreferences
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}