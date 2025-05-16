import 'package:flutter/material.dart';

class EnemyWidget extends StatelessWidget {
  final int enemyIndex;
  final int health;

  const EnemyWidget({
    super.key,
    required this.enemyIndex,
    required this.health,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enemy ${enemyIndex + 1}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text('Health: $health'),
        const SizedBox(height: 8),
        const Icon(Icons.warning_amber_rounded, size: 40, color: Colors.red),
      ],
    );
  }
}
