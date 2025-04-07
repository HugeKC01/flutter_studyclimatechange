import 'dart:async';
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

  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                _formatTime(_elapsedSeconds),
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header bar for the question text
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary.withAlpha((0.1 * 255).toInt()),
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Question number
                Text(
                  'Question ${questionIndex + 1}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Question text
                Text(
                  currentQuestion['questionText'] as String,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
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
                      // Answer Options
                      ..._buildAnswerOptions(currentQuestion),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Footer with navigation buttons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (questionIndex > 0)
                  ElevatedButton(
                    onPressed: previousQuestion,
                    child: const Text('Previous'),
                  ),
                if (questionIndex < questions.length - 1)
                  ElevatedButton(
                    onPressed: nextQuestion,
                    child: const Text('Next'),
                  )
                else
                  ElevatedButton(
                    onPressed: submitQuiz,
                    child: const Text('Submit'),
                  ),
              ],
            ),
          ),
        ],
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