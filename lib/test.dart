import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PostTestScreen extends StatefulWidget {
  const PostTestScreen({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<PostTestScreen> {
  int questionIndex = 0;
  final Logger _logger = Logger('QuizPageState');

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': ['A framework', 'A bird', 'A car', 'A programming language'],
      'correctAnswer': 'A framework',
    },
    {
      'questionText': 'Who developed Flutter?',
      'answers': ['Google', 'Apple', 'Microsoft', 'Facebook'],
      'correctAnswer': 'Google',
    },
  ];

  void answerQuestion(String answer) {
    setState(() {
      if (answer == questions[questionIndex]['correctAnswer']) {
        _logger.info('Correct Answer!');
      } else {
        _logger.info('Wrong Answer!');
      }

      questionIndex = (questionIndex + 1) % questions.length; // Next question
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              questions[questionIndex]['questionText'] as String,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
              return ElevatedButton(
                onPressed: () => answerQuestion(answer),
                child: Text(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}