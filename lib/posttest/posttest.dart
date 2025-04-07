import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'testsummary.dart';

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
      'questionText': 'การเปลี่ยนแปลงสภาพภูมิอากาศมีผลกระทบโดยตรงต่อสิ่งใดบ้างมากที่สุด?',
      'answers': ['a) อาหารที่เรากิน', 'b) อาชีพที่เราทำ', 'c) คู่ชีวิตในอนาคต', 'd) ราคาน้ำมัน'],
      'correctAnswer': 'a) อาหารที่เรากิน',
      'selectedAnswer': '',
    },
    {
      'questionText': 'สัตว์ชนิดใดที่มักอพยพไปอยู่ในที่ที่มีอุณหภูมิพอเหมาะเมื่อฤดูกาลเปลี่ยนไป?',
      'answers': ['a) ช้าง', 'b) นก', 'c) แมว', 'd) ลิง'],
      'correctAnswer': 'b) นก',
      'selectedAnswer': '',
    },
  ];

  void answerQuestion(String answer) {
    setState(() {
      questions[questionIndex]['selectedAnswer'] = answer;
    });
  }

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    }
  }

  void previousQuestion() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
      });
    }
  }

  void submitQuiz() {
    score = questions.where((question) => question['selectedAnswer'] == question['correctAnswer']).length;
    _logger.info('Quiz Submitted! Final Score: $score');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostTestResultScreen(
          score: score,
          totalQuestions: questions.length,
          questions: questions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Question Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentQuestion['questionText'] as String,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20.0),

                // Answer Options
                ..._buildAnswerOptions(currentQuestion),

                const SizedBox(height: 20.0),
                const Divider(),

                // Navigation Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (questionIndex > 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: previousQuestion,
                          child: const Text('Previous'),
                        ),
                      ),
                    if (questionIndex < questions.length - 1)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: nextQuestion,
                          child: const Text('Next'),
                        ),
                      )
                    else
                      Expanded(
                        child: ElevatedButton(
                          onPressed: submitQuiz,
                          child: const Text('Submit'),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build answer options
  List<Widget> _buildAnswerOptions(Map<String, Object> question) {
    final answers = question['answers'] as List<String>;
    final selectedAnswer = question['selectedAnswer'] as String;

    return answers.map((answer) {
      final isSelected = selectedAnswer == answer;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
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
    }).toList();
  }
}