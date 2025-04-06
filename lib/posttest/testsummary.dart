import 'package:flutter/material.dart';

class PostTestResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, Object>> questions;

  const PostTestResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Test Results'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  'Your Score',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                  '$score / $totalQuestions',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  child: const Text('Back to Home'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Expanded(
            //   child: ListView.builder(
            //     itemCount: questions.length,
            //     itemBuilder: (context, index) {
            //       final question = questions[index];
            //       final questionText = question['questionText'] as String;
            //       final correctAnswer = question['correctAnswer'] as String;
            //       final selectedAnswer = question['selectedAnswer'] as String;

            //       return Card(
            //         margin: const EdgeInsets.symmetric(vertical: 8.0),
            //         child: ListTile(
            //           title: Text(
            //             questionText,
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           subtitle: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Correct Answer: $correctAnswer'),
            //               Text(
            //                 'Your Answer: $selectedAnswer',
            //                 style: TextStyle(
            //                   color: selectedAnswer == correctAnswer
            //                       ? Colors.green
            //                       : Colors.red,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),