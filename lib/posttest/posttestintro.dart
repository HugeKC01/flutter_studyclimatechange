import 'package:flutter/material.dart';
import 'posttest.dart';

class PostTestIntroduction extends StatelessWidget {
  const PostTestIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Test Introduction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            const Text(
              'Welcome to the Post Test!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),

            // Description
            const Text(
              'This test will evaluate your understanding of the topics covered in the modules. '
              'Take your time and answer each question carefully.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),

            // Instructions
            ..._buildInstructions(),

            const SizedBox(height: 32.0),

            // Start Post Test Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the post-test screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostTestScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Start Post Test',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build instruction cards
  List<Widget> _buildInstructions() {
    const instructions = [
      '1. Read each question carefully before answering.',
      '2. There is no time limit, so take your time.',
      '3. Once you submit, you cannot change your answers.',
    ];

    return instructions
        .map(
          (instruction) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  instruction,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}