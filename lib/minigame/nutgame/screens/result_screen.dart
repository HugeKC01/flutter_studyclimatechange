import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool didPlayerWin;

  const ResultScreen({super.key, required this.didPlayerWin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game Over')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              didPlayerWin ? 'You Win!' : 'You Lose!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true); // Replay the game
              },
              child: const Text('Replay'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false); // Exit the game
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
