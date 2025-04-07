import 'package:flutter/material.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/learningpage/module3/m3_summary.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/appbar.dart';
import 'enhancedintro.dart';

class EnhancedM3ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, Object>> questions;
  final int elapsedSeconds;

  const EnhancedM3ResultScreen({
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
      body: Column(
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
                              'Activity Result',
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
          // List of question results
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final questionText = question['questionText'] as String;
                final selectedAnswer = question['selectedAnswer'] as String;
                final correctAnswer = question['correctAnswer'] as String;
                final isCorrect = selectedAnswer == correctAnswer;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${index + 1}:',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          questionText,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Your Answer: $selectedAnswer',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                        ),
                        if (!isCorrect)
                          Text(
                            'Correct Answer: $correctAnswer',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Footer with Exit button
            SafeArea(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary.withAlpha((0.1 * 255).toInt()),
              padding: const EdgeInsets.all(16.0),
              child: Row(
              children: [
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Module3Screen()),
                  );
                },
                child: const Text('กลับไปที่หน้าหลัก'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EnhancedM3Introduction()),
                  );
                },
                child: const Text('เริ่มใหม่'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Module3Sum()),
                  );
                },
                child: const Text('ถัดไป'),
                ),
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}