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
      'questionText': 'การเปลี่ยนแปลงสภาพภูมิอากาศมีผลกระทบโดยตรงต่อสิ่งใดบ้างมากที่สุด?',
      'answers': ['a) อาหารที่เรากิน', 'b) อาชีพที่เราทำ', 'c) คู่ชีวิตในอนาคต', 'd) ราคาน้ำมัน'],
      'correctAnswer': 'a) อาหารที่เรากิน',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ทำไมเราต้องสนใจเรื่องการเปลี่ยนแปลงสภาพภูมิอากาศ?',
      'answers': ['a) เพราะมันไม่มีผลกระทบต่อเรา', 'b) เพราะมันมีผลกระทบต่อชีวิตของมนุษย์และสิ่งแวดล้อม', 'c) เพราะมันทำให้เรารวยขึ้น', 'd) เพราะมันทำให้เรามีความสุข'],
      'correctAnswer': 'a) เพราะมันไม่มีผลกระทบต่อเรา',
      'selectedAnswer': '',
    },
    {
      'questionText': 'วิธีใดที่ช่วยลดการใช้พลังงานได้?',
      'answers': ['a) ปิดไฟเมื่อไม่ใช้', 'b) เปิดไฟตลอดเวลา', 'c) ใช้เครื่องใช้ไฟฟ้าเก่า', 'd) เปิดแอร์ให้เย็นที่สุด'],
      'correctAnswer': 'a) ปิดไฟเมื่อไม่ใช้',
      'selectedAnswer': '',
    },
    {
      'questionText': 'พาหนะใดที่เป็นมิตรต่อสิ่งแวดล้อม?',
      'answers': ['a) รถยนต์ส่วนตัว', 'b) เครื่องบิน', 'c) เดิน ขี่จักรยาน หรือใช้ขนส่งสาธารณะ', 'd) เรือสำราญ'],
      'correctAnswer': 'a) รถยนต์ส่วนตัว',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ต้นไม้มีบทบาทอย่างไรในการลดภาวะโลกร้อน?',
      'answers': ['a) ปล่อยก๊าซคาร์บอนไดออกไซด์', 'b) ดูดซับก๊าซคาร์บอนไดออกไซด์', 'c) ปล่อยก๊าซมีเทน', 'd) ดูดซับก๊าซมีเทน'],
      'correctAnswer': 'a) ปล่อยก๊าซคาร์บอนไดออกไซด์',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ข้อใดเป็นวิธีที่ช่วยให้ร่างกายเย็นลงเมื่ออุณหภูมิสูงขึ้น?',
      'answers': ['a) ดื่มน้ำมากขึ้น', 'b) ใส่เสื้อผ้าหนา ๆ', 'c) ออกแดดตอนเที่ยงวัน', 'd) ปิดหน้าต่างให้สนิท'],
      'correctAnswer': 'a) ดื่มน้ำมากขึ้น',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ทำไมการปลูกต้นไม้รอบบ้านจึงช่วยลดอุณหภูมิได้?',
      'answers': ['a) เพราะต้นไม้ทำให้แดดร้อนขึ้น', 'b) เพราะต้นไม้ดูดซับน้ำฝน', 'c) เพราะต้นไม้ให้ร่มเงาและช่วยลดความร้อน', 'd) เพราะต้นไม้ทำให้ลมแรงขึ้น'],
      'correctAnswer': 'a) เพราะต้นไม้ทำให้แดดร้อนขึ้น',
      'selectedAnswer': '',
    },
    {
      'questionText': 'ควรทำอย่างไรเมื่ออากาศเปลี่ยนแปลงไม่ตรงกับฤดูกาล?',
      'answers': [' a) ไม่ต้องสนใจ เพราะอากาศเปลี่ยนเองได้', 'b) ใส่เสื้อผ้าให้เหมาะสมกับอากาศ', 'c) ออกไปทำกิจกรรมกลางแจ้งโดยไม่ดูพยากรณ์อากาศ', 'd) ปลูกพืชที่ต้องการน้ำมากเสมอ'],
      'correctAnswer': 'a) ไม่ต้องสนใจ เพราะอากาศเปลี่ยนเองได้',
      'selectedAnswer': '',
    },
    {
      'questionText': 'เพราะเหตุใดการติดตามข่าวพยากรณ์อากาศจึงสำคัญ?',
      'answers': ['a) เพื่อให้รู้ว่าใครเป็นผู้ประกาศข่าว', 'b) เพื่อเตรียมตัวและวางแผนกิจกรรมให้เหมาะสม', 'c) เพื่อให้สามารถเปลี่ยนฤดูกาลได้', 'd) เพื่อให้รู้ว่าเมฆสีอะไร'],
      'correctAnswer': 'a) เพื่อให้รู้ว่าใครเป็นผู้ประกาศข่าว',
      'selectedAnswer': '',
    },
    {
      'questionText': 'สัตว์ชนิดใดที่มักอพยพไปอยู่ในที่ที่มีอุณหภูมิพอเหมาะเมื่อฤดูกาลเปลี่ยนไป?',
      'answers': [' a) ช้าง', 'b) นก', 'c) แมว', ' d) ลิง'],
      'correctAnswer': 'a) ช้าง',
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
                    }).toList(),
                    SizedBox(height: 20.0),
                    Divider(),
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