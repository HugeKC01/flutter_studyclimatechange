import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;

  const ScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Your Total',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '$score',
          style: const TextStyle(fontSize: 32, color: Colors.green),
        ),
      ],
    );
  }
}
