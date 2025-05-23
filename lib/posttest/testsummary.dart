import 'package:flutter/material.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/appbar.dart';

class PostTestResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, Object>> questions;
  final int elapsedSeconds;

  const PostTestResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.questions,
    required this.elapsedSeconds,
  });

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        '',
        context,
      ),
      drawer: buildDrawer(context),
      body: Stack(
        children: [
          Positioned.fill(
        child: Opacity(
          opacity: 0.08, // Adjust the opacity value as needed
          child: Image.asset(
            'asset/overall/background1.png', // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
          ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page title under the AppBar
          SafeArea(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary.withAlpha((0.1 * 255).toInt()),
              padding: const EdgeInsets.all(30.0),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Page title
                Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Post Test Result',
                  style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Time Taken: ${_formatTime(elapsedSeconds)}',
                  style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
                ),
                // Align "Your Score" and score in a column
                Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Your Score:',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  '$score / $totalQuestions',
                  style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
                  ),
                ),
              ),
            ],
                ),
              ],
            ),
          ],
              ),
            ),
          ),
          // Spacer to push the footer to the bottom
          const Spacer(),
          SafeArea(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary.withAlpha((0.1 * 255).toInt()),
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text('Back to Home'),
              ),
            ),
          ),
        ],
      ),
        ],
      ),
    );
  }
} //Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);