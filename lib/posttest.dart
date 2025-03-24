import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PostTestScreen extends StatefulWidget {
  const PostTestScreen({Key? key}) : super(key: key);

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
    });
  }

  void nextQuestion() {
    setState(() {
      questionIndex = (questionIndex + 1) % questions.length;
    });
  }

  void previousQuestion() {
    setState(() {
      questionIndex = (questionIndex - 1 + questions.length) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    }).toList(),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: previousQuestion,
                          child: Text('Previous'),
                        ),
                        ElevatedButton(
                          onPressed: nextQuestion,
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}