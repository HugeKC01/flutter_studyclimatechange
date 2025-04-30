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
  'questionText': 'ข้อใดแตกต่างจาก "ภูมิอากาศ"?',
  'answers': [
    'ฤดูร้อนมีอากาศร้อนตลอดหลายเดือน',
    'ฤดูฝนมีฝนตกเป็นประจำทุกปี',
    'วันนี้ฝนตกหนักและมีลมแรง',
    'ฤดูหนาวมีอุณหภูมิลดลงในหลายพื้นที่',
  ],
  'correctAnswer': 'วันนี้ฝนตกหนักและมีลมแรง',
  'selectedAnswer': '',
},
{
  'questionText': 'ข้อใดเป็นสาเหตุทางธรรมชาติที่ทำให้สภาพภูมิอากาศเปลี่ยนแปลง?',
  'answers': [
    'การตัดไม้ทำลายป่า',
    'การใช้รถยนต์ที่ปล่อยควันพิษ',
    'ภูเขาไฟระเบิด',
    'โรงงานอุตสาหกรรมปล่อยก๊าซเรือนกระจก',
  ],
  'correctAnswer': 'ภูเขาไฟระเบิด',
  'selectedAnswer': '',
},
{
  'questionText': 'ถ้าอุณหภูมิโลกสูงขึ้นมาก จะเกิดผลกระทบอย่างไร?',
  'answers': [
    'อากาศจะเย็นลงทั่วโลก',
    'ฤดูร้อนจะสั้นลง',
    'อาจเกิดคลื่นความร้อนและภัยแล้งบ่อยขึ้น',
    'ฝนจะตกทุกวัน',
  ],
  'correctAnswer': 'อาจเกิดคลื่นความร้อนและภัยแล้งบ่อยขึ้น',
  'selectedAnswer': '',
},
{
  'questionText': 'พฤติกรรมในข้อใดช่วยลดผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ?',
  'answers': [
    'ใช้พลังงานไฟฟ้าอย่างสิ้นเปลือง',
    'ปลูกต้นไม้เพิ่มเพื่อช่วยดูดซับก๊าซคาร์บอนไดออกไซด์',
    'เผาขยะทุกวัน',
    'เดินทางโดยใช้รถยนต์เพียงคนเดียวเสมอ',
  ],
  'correctAnswer': 'ปลูกต้นไม้เพิ่มเพื่อช่วยดูดซับก๊าซคาร์บอนไดออกไซด์',
  'selectedAnswer': '',
},
{
  'questionText': 'ข้อใดเป็นวิธีที่ช่วยลดการเปลี่ยนแปลงสภาพภูมิอากาศ?',
  'answers': [
    'ใช้พลังงานสะอาด เช่น พลังงานแสงอาทิตย์',
    'ตัดไม้ทำลายป่าเพื่อสร้างที่อยู่อาศัย',
    'ปล่อยควันจากโรงงานอุตสาหกรรมมากขึ้น',
    'ใช้รถยนต์ส่วนตัวแทนการเดินหรือขี่จักรยาน',
  ],
  'correctAnswer': 'ใช้พลังงานสะอาด เช่น พลังงานแสงอาทิตย์',
  'selectedAnswer': '',
},
{
  'questionText': 'การใช้ปุ๋ยเคมีและสารกำจัดศัตรูพืชส่งผลเสียอย่างไร?',
  'answers': [
    'ทำให้ดินและน้ำเกิดมลพิษ',
    'ทำให้พืชเติบโตได้ดีโดยไม่มีผลกระทบ',
    'ทำให้น้ำสะอาดขึ้น',
    'ทำให้ฝนตกทุกวัน',
  ],
  'correctAnswer': 'ทำให้ดินและน้ำเกิดมลพิษ',
  'selectedAnswer': '',
},
{
  'questionText': 'วิธีใดช่วยลดผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ?',
  'answers': [
    'ใช้พลังงานหมุนเวียน เช่น พลังงานแสงอาทิตย์',
    'ใช้รถยนต์มากขึ้น',
    'ตัดไม้ทำลายป่าเพิ่มขึ้น',
    'เผาพื้นที่เกษตรเพื่อเพิ่มผลผลิต',
  ],
  'correctAnswer': 'ใช้พลังงานหมุนเวียน เช่น พลังงานแสงอาทิตย์',
  'selectedAnswer': '',
},
{
  'questionText': 'ข้อใดต่อไปนี้เป็นผลกระทบที่เห็นได้ชัดเจนของการเปลี่ยนแปลงสภาพอากาศ?',
  'answers': [
    'กลางวันสั้นลง กลางคืนยาวขึ้น',
    'ฤดูกาลเปลี่ยนแปลงไปจากเดิม',
    'ท้องฟ้ามีสีสวยงามมากขึ้น',
    'มีดาวบนท้องฟ้ามากขึ้น',
  ],
  'correctAnswer': 'ฤดูกาลเปลี่ยนแปลงไปจากเดิม',
  'selectedAnswer': '',
},
{
  'questionText': 'อุณหภูมิที่สูงขึ้นอาจส่งผลเสียต่อพืชที่เราปลูกไว้กินอย่างไร?',
  'answers': [
    'ทำให้พืชโตเร็วมากเกินไป',
    'ทำให้พืชเหี่ยวเฉาและตาย',
    'ทำให้พืชมีสีสันสวยงามขึ้น',
    'ทำให้พืชมีรสชาติหวานขึ้น',
  ],
  'correctAnswer': 'ทำให้พืชเหี่ยวเฉาและตาย',
  'selectedAnswer': '',
},
{
  'questionText': 'การเปลี่ยนแปลงสภาพอากาศอาจทำให้เกิดอะไรที่รุนแรงขึ้น?',
  'answers': [
    'แสงแดดอ่อนลง',
    'ลมสงบ',
    'พายุ',
    'อากาศเย็นสบาย',
  ],
  'correctAnswer': 'พายุ',
  'selectedAnswer': '',
},
{
  'questionText': 'ควรทำอย่างไรเมื่ออากาศเปลี่ยนแปลงไม่ตรงกับฤดูกาล?',
  'answers': [
    'ไม่ต้องสนใจ เพราะอากาศเปลี่ยนเองได้',
    'ใส่เสื้อผ้าให้เหมาะสมกับอากาศ',
    'ออกไปทำกิจกรรมกลางแจ้งโดยไม่ดูพยากรณ์อากาศ',
    'ปลูกพืชที่ต้องการน้ำมากเสมอ',
  ],
  'correctAnswer': 'ใส่เสื้อผ้าให้เหมาะสมกับอากาศ',
  'selectedAnswer': '',
},
{
  'questionText': 'สัตว์ชนิดใดที่มักอพยพไปอยู่ในที่ที่มีอุณหภูมิพอเหมาะเมื่อฤดูกาลเปลี่ยนไป?',
  'answers': [
    'ช้าง',
    'นก',
    'แมว',
    'ลิง',
  ],
  'correctAnswer': 'นก',
  'selectedAnswer': '',
},
{
  'questionText': 'ต้นไม้บางชนิดอาจออกดอกช้าหรือเร็วขึ้นกว่าปกติ เพราะเหตุใด?',
  'answers': [
    'เพราะต้นไม้สับสน',
    'เพราะสภาพอากาศเปลี่ยนแปลง',
    'เพราะคนไม่รดน้ำ',
    'เพราะต้นไม้ขี้เกียจออกดอก',
  ],
  'correctAnswer': 'เพราะสภาพอากาศเปลี่ยนแปลง',
  'selectedAnswer': '',
},
{
  'questionText': 'ข้อใดต่อไปนี้ เป็นขยะเปียก?',
  'answers': [
    'กล่องนม',
    'เศษอาหาร',
    'ถุงพลาสติก',
    'กระป๋องน้ำอัดลม',
  ],
  'correctAnswer': 'เศษอาหาร',
  'selectedAnswer': '',
},
{
  'questionText': 'ข้อใดเป็นประโยชน์ของการวางแผนกิจกรรมกลางแจ้งตามสภาพอากาศ?',
  'answers': [
    'ทำให้สามารถเตรียมตัวได้เหมาะสม',
    'ทำให้สนุกขึ้นโดยไม่ต้องสนใจอากาศ',
    'ทำให้กิจกรรมกลางแจ้งต้องเลื่อนออกไปตลอด',
    'ทำให้ฝนตกเมื่อออกไปข้างนอก',
  ],
  'correctAnswer': 'ทำให้สามารถเตรียมตัวได้เหมาะสม',
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
        builder: (context) => PostTestResultScreen(
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
                Navigator.of(context).popUntil((route) => route.isFirst); // Navigate to the first screen
                },
                child: const Text('Exit'),
              ),
            ],
              );
            },
          );
          },
        ),
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