import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  final List<bool> moduleLockedStatus;
  final Function(List<bool>) onLockStatusChanged;

  const AdminScreen({
    super.key,
    required this.moduleLockedStatus,
    required this.onLockStatusChanged,
  });

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late List<bool> _moduleLockedStatus;

  @override
  void initState() {
    super.initState();
    _moduleLockedStatus = List.from(widget.moduleLockedStatus); // Copy the initial state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: ListView.builder(
        itemCount: _moduleLockedStatus.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Module ${index + 1}'),
            subtitle: Text(_moduleLockedStatus[index] ? 'Locked' : 'Unlocked'),
            trailing: Switch(
              value: !_moduleLockedStatus[index], // Invert for lock/unlock
              onChanged: (value) {
                setState(() {
                  _moduleLockedStatus[index] = !value; // Update lock status
                });
                widget.onLockStatusChanged(_moduleLockedStatus); // Notify parent
              },
            ),
          );
        },
      ),
    );
  }
}