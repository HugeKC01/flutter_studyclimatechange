import 'package:flutter/material.dart';

final ValueNotifier<List<bool>> moduleLockedStatusNotifier = ValueNotifier<List<bool>>([false, true, true, true]);
final ValueNotifier<bool> darkModeNotifier = ValueNotifier<bool>(false); // Add dark mode notifier