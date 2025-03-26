import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PostTestScreen extends StatefulWidget {
  const PostTestScreen({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<PostTestScreen> {
  int questionIndex = 0;
  int score = 0;
  final Logger _logger = Logger('QuizPageState');

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': ['A framework', 'A bird', 'A car', 'A programming language'],
      'correctAnswer': 'A framework',
      'selectedAnswer': '',
    },
    {
      'questionText': 'Who developed Flutter?',
      'answers': ['Google', 'Apple', 'Microsoft', 'Facebook'],
      'correctAnswer': 'Google',
      'selectedAnswer': '',
    },
  ];

  void answerQuestion(String answer) {
    setState(() {
      questions[questionIndex]['selectedAnswer'] = answer;
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

  void submitQuiz() {
    setState(() {
      score = 0;
      for (var question in questions) {
        if (question['selectedAnswer'] == question['correctAnswer']) {
          score++;
        }
      }
      _logger.info('Quiz Submitted! Final Score: $score');
    });
    // Add any additional submission logic here
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  questions[questionIndex]['questionText'] as String,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                SizedBox(height: 20.0),
                ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
                  bool isSelected = questions[questionIndex]['selectedAnswer'] == answer;
                  return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                  onPressed: () => answerQuestion(answer),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Theme.of(context).colorScheme.secondary : null,
                  foregroundColor: isSelected ? Colors.white : null,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(answer),
                  ),
                  ),
                  );
                }),
                    SizedBox(height: 20.0),
                    Divider(), // Add this line for the divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (questionIndex > 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: previousQuestion,
                              child: Text('Previous'),
                            ),
                          ),
                        if (questionIndex < questions.length - 1)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: nextQuestion,
                              child: Text('Next'),
                            ),
                          )
                        else
                          Expanded(
                            child: ElevatedButton(
                              onPressed: submitQuiz,
                              child: Text('Submit'),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Score: $score',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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