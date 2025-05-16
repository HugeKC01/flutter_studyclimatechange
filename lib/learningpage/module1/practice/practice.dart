import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'practicesummary.dart';

class PracticeM1Screen extends StatefulWidget {
  const PracticeM1Screen({super.key});

  @override
  PracticeM1PageState createState() => PracticeM1PageState();
}

class PracticeM1PageState extends State<PracticeM1Screen> {
  int questionIndex = 0;
  int score = 0;
  final Logger _logger = Logger('PracticeM1State');

  final List<Map<String, Object>> questions = [
    {
      'questionText': 'ข้อใดอธิบายความหมายของ "ภูมิอากาศ" ได้ถูกต้อง?',
      'answers': ['สภาพอากาศที่เปลี่ยนแปลงทุกวัน', 'ลักษณะของอากาศที่เกิดขึ้นในระยะเวลาสั้น ๆ', 'ลักษณะของอากาศที่เกิดขึ้นเป็นระยะเวลานานคิดเป็นค่าเฉลี่ยในแต่ละพื้นที่', 'ปริมาณฝนที่ตกในแต่ละวัน'],
      'correctAnswer': 'ลักษณะของอากาศที่เกิดขึ้นเป็นระยะเวลานานคิดเป็นค่าเฉลี่ยในแต่ละพื้นที่',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ข้อใดไม่เกี่ยวข้องกับการเปลี่ยนแปลงสภาพภูมิอากาศ?',
      'answers': ['การเปลี่ยนแปลงที่เกิดขึ้นในสภาพภูมิอากาศของโลก', 'ไม่ส่งผลกระทบต่อสิ่งมีชีวิต', 'เกิดจากการกระทำของมนุษย์', 'เกิดจากธรรมชาติ'],
      'correctAnswer': 'ไม่ส่งผลกระทบต่อสิ่งมีชีวิต',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ข้อใดเป็นสาเหตุที่เกิดจากมนุษย์และทำให้สภาพภูมิอากาศเปลี่ยนแปลง?',
      'answers': ['ภูเขาไฟระเบิด', 'การเผาไหม้เชื้อเพลิงฟอสซิล', 'การหมุนของโลก', 'การเปลี่ยนแปลงของดวงอาทิตย์'],
      'correctAnswer': 'การเผาไหม้เชื้อเพลิงฟอสซิล',
      'selectedAnswer': '',
    },
    {
      'questionText': 'การเปลี่ยนแปลงสภาพภูมิอากาศทำให้เกิดผลกระทบในข้อใด?',
      'answers': ['อากาศเย็นขึ้นทุกปี', 'น้ำแข็งขั้วโลกละลาย ทำให้ระดับน้ำทะเลสูงขึ้น', 'ปริมาณน้ำในแม่น้ำลดลงทุกวัน', 'พายุและฝนตกหนักลดลง'],
      'correctAnswer': 'น้ำแข็งขั้วโลกละลาย ทำให้ระดับน้ำทะเลสูงขึ้น',
      'selectedAnswer': '',
    },
    {
      'questionText': 'น้ำแข็งขั้วโลกละลายมีผลกระทบต่อสิ่งมีชีวิตอย่างไร?',
      'answers': ['ทำให้สัตว์บางชนิดสูญพันธุ์', 'ทำให้สัตว์อาศัยอยู่ได้ง่ายขึ้น', 'ทำให้ป่ามีต้นไม้มากขึ้น', 'ทำให้อุณหภูมิลดลงทั่วโลก'],
      'correctAnswer': 'ทำให้สัตว์บางชนิดสูญพันธุ์',
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
        builder: (context) => PracticeM1ResultScreen(
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
        title: const Text('แบบทดสอบหลังเรียน Module 1'),
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