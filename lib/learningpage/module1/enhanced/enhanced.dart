import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'enhancedsummary.dart';

class EnhancedM1Screen extends StatefulWidget {
  const EnhancedM1Screen({super.key});

  @override
  EnhancedM1PageState createState() => EnhancedM1PageState();
}

class EnhancedM1PageState extends State<EnhancedM1Screen> {
  int questionIndex = 0;
  int score = 0;
  final Logger _logger = Logger('EnhancedM1State');

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'ข้อใดอธิบายความหมายของ "สภาพอากาศ" ได้ถูกต้อง?',
      'answers': ['ฤดูกาลที่เกิดขึ้นทุกๆปี', 'ลักษณะของอากาศที่เกิดขึ้นในระยะเวลาสั้น ๆ ในแต่ละวัน', 'ลักษณะของอากาศที่เกิดขึ้นเป็นระยะเวลานานคิดเป็นค่าเฉลี่ยในแต่ละพื้นที่', 'ฤดูร้อนที่อากาศร้อน หลายเดือน'],
      'correctAnswer': 'ลักษณะของอากาศที่เกิดขึ้นในระยะเวลาสั้น ๆ ในแต่ละวัน',
      'selectedAnswer': '',
    },
    {
      'questionText': 'การเปลี่ยนแปลงสภาพภูมิอากาศหมายถึงอะไร?',
      'answers': ['การเปลี่ยนแปลงของสภาพอากาศในระยะสั้น', 'การเปลี่ยนแปลงของสภาพอากาศในระยะยาว เช่น อุณหภูมิโลกสูงขึ้น', 'การเปลี่ยนแปลงของลมและฝนในแต่ละวัน', 'การเกิดฝนตกหนักเพียงครั้งเดียวในปีนั้น'],
      'correctAnswer': 'การเปลี่ยนแปลงของสภาพอากาศในระยะยาว เช่น อุณหภูมิโลกสูงขึ้น',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ข้อใดบ้างไม่ใช่ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ',
      'answers': ['โรคลมแดด', 'ฝนตกในหน้าร้อน', 'แผ่นดินไหว', 'น้ำท่วมนาข้าว'],
      'correctAnswer': 'แผ่นดินไหว',
      'selectedAnswer': '',
    },
  ];

  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
  super.initState();
  _shuffleAnswers(); // Shuffle answers when the quiz starts
  _startTimer();
  }

  void _shuffleAnswers() {
    for (var question in questions) {
      final answers = question['answers'] as List<String>;
      answers.shuffle(); // Shuffle the answers
    }
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
        builder: (context) => EnhancedM1ResultScreen(
          score: score,
          totalQuestions: questions.length,
          questions: questions,
          elapsedSeconds: _elapsedSeconds, // Pass elapsed time
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit the post test? Your progress will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.of(context).pop(); // Exit the screen
              },
              child: const Text('Exit'),
            ),
          ],
            );
          },
        );
          },
        ),
        title: const Text('กิจกรรมเสริมความเข้าใจ'),
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
      body: SafeArea(
        child: Column(
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
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Answer Options filling the available space
                    Expanded(
                      child: Column(
                        children: _buildAnswerOptions(currentQuestion),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Footer with navigation buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withAlpha((0.1 * 255).toInt()),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                children: [
                  if (questionIndex > 0)
                    ElevatedButton(
                      onPressed: previousQuestion,
                      child: const Text('Previous'),
                    ),
                  if (questionIndex < questions.length - 1) ...[
                    const Spacer(), // Pushes the Next button to the right
                    ElevatedButton(
                      onPressed: nextQuestion,
                      child: const Text('Next'),
                    ),
                  ] else ...[
                    const Spacer(), // Pushes the Submit button to the right
                    ElevatedButton(
                      onPressed: submitQuiz,
                      child: const Text('Submit'),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build answer options
  List<Widget> _buildAnswerOptions(Map<String, Object> question) {
    final answers = question['answers'] as List<String>;
    final selectedAnswer = question['selectedAnswer'] as String;

    return answers.asMap().entries.map((entry) {
      final index = entry.key;
      final answer = entry.value;
      final isSelected = selectedAnswer == answer;

      // Map index to corresponding letter (a, b, c, d)
      final optionLetter = String.fromCharCode(97 + index); // 97 is ASCII for 'a'

      return Expanded(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: ElevatedButton(
            onPressed: () => answerQuestion(answer),
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Theme.of(context).colorScheme.secondary : null,
              foregroundColor: isSelected ? Colors.white : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Lowered corner radius
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$optionLetter) $answer', // Add the letter prefix
                style: const TextStyle(fontSize: 18.0), // Increased font size
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}