import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'practicesummary.dart';

class PracticeM2Screen extends StatefulWidget {
  const PracticeM2Screen({super.key});

  @override
  PracticeM2PageState createState() => PracticeM2PageState();
}

class PracticeM2PageState extends State<PracticeM2Screen> {
  int questionIndex = 0;
  int score = 0;
  final Logger _logger = Logger('PracticeM2State');

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'ข้อใดเป็นสาเหตุที่ทำให้เกิดการเปลี่ยนแปลงสภาพภูมิอากาศจากมนุษย์?',
      'answers': ['การหมุนของโลก', 'การใช้รถยนต์ที่ปล่อยก๊าซคาร์บอนไดออกไซด์', 'การเกิดพายุธรรมชาติ', 'การเกิดแผ่นดินไหว'],
      'correctAnswer': 'การใช้รถยนต์ที่ปล่อยก๊าซคาร์บอนไดออกไซด์',
      'selectedAnswer': '',
    },
    {
      'questionText': 'การใช้รถยนต์และมอเตอร์ไซค์มากเกินไปส่งผลอย่างไรต่อสภาพภูมิอากาศ?',
      'answers': ['ทำให้โลกเย็นลง', 'ทำให้เกิดฝนตกมากขึ้น', 'ทำให้เกิดก๊าซคาร์บอนไดออกไซด์เพิ่มขึ้นในชั้นบรรยากาศ', 'ทำให้อากาศสดชื่นขึ้น'],
      'correctAnswer': 'ทำให้เกิดก๊าซคาร์บอนไดออกไซด์เพิ่มขึ้นในชั้นบรรยากาศ',
      'selectedAnswer': '',
    },
    {
      'questionText': 'การตัดไม้ทำลายป่าส่งผลอย่างไรต่อสิ่งแวดล้อม?',
      'answers': ['ทำให้ออกซิเจนลดลงและก๊าซคาร์บอนไดออกไซด์เพิ่มขึ้น', 'ทำให้สัตว์ป่าเพิ่มขึ้น', 'ทำให้อากาศเย็นขึ้น', 'ทำให้ฝนตกทุกวัน'],
      'correctAnswer': 'ทำให้ออกซิเจนลดลงและก๊าซคาร์บอนไดออกไซด์เพิ่มขึ้น',
      'selectedAnswer': '',
    },
    {
      'questionText': 'สัตว์ที่อาศัยอยู่ในที่ที่มีอากาศหนาวเย็นมากๆ เช่น หมีขั้วโลก จะได้รับผลกระทบจากการเปลี่ยนแปลงสภาพอากาศอย่างไร?',
      'answers': ['มีอาหารมากขึ้น', 'มีที่อยู่อาศัยกว้างขึ้น', 'น้ำแข็งละลาย ทำให้ไม่มีที่อยู่', 'ขนยาวและหนาขึ้น'],
      'correctAnswer': 'น้ำแข็งละลาย ทำให้ไม่มีที่อยู่',
      'selectedAnswer': '',
    },
    {
      'questionText': 'การเปลี่ยนแปลงสภาพอากาศอาจทำให้เกิดภัยแล้ง หมายถึงอะไร?',
      'answers': ['มีฝนตกมากผิดปกติ', 'มีลมพัดแรงตลอดเวลา', 'มีน้ำท่วมสูง', 'มีฝนน้อยหรือไม่มีฝนเป็นเวลานาน'],
      'correctAnswer': 'มีฝนน้อยหรือไม่มีฝนเป็นเวลานาน',
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
        builder: (context) => PracticeM2ResultScreen(
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
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Confirm Exit'),
                content: const Text('Are you sure you want to exit the post test? Your progress will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Close the dialog
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Close the dialog
                      Navigator.of(context).popUntil((route) => route.isFirst); // Use parent context for navigation
                    },
                    child: const Text('Exit'),
                  ),
                ],
              );
            },
          );
          },
        ),
        title: const Text('แบบทดสอบหลังเรียน Module 2'),
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
        SafeArea(
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
        ],
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