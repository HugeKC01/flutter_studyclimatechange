import 'package:flutter/material.dart';
import '../../../minigame_main.dart';

class Module1l2Quiz extends StatefulWidget {
  const Module1l2Quiz({super.key});

  @override
  State<Module1l2Quiz> createState() => _Module1l2QuizState();
}

class _Module1l2QuizState extends State<Module1l2Quiz> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'ประเทศไทยมีกี่ฤดู?',
      'options': ['1', '2', '3', '4'],
      'answer': '3',
    },
    {
      'question': 'ประเทศไทยมีฤดูอะไรบ้าง?',
      'options': ['ร้อน,ฝน,หนาว', 'ร้อน,ร้อนมาก,ร้อนมากมาก', 'ใบไม้ผลิ,ใบไม้ร่วง,หนาว', 'ร้อน,ร้อนมาก,ฝน'],
      'answer': 'ร้อน,ฝน,หนาว',
    },
    {
      'question': 'เดือนเมษายนเป็นฤดูอะไร?',
      'options': ['ฤดูใบไม้ผลิ','ฤดูฝน', 'ฤดูหนาว', 'ฤดูร้อน'],
      'answer': 'ฤดูร้อน',
    },
  ];

  int _current = 0;
  int _score = 0;
  String _selectedOption = '';

  void _checkAnswer(String option) {
    setState(() {
      _selectedOption = option;
      if (option == _questions[_current]['answer']) {
        _score++;
      }
    });
    Future.delayed(const Duration(seconds: 1), _nextQuestion);
  }

  void _nextQuestion() {
    if (_current < _questions.length - 1) {
      setState(() {
        _current++;
        _selectedOption = '';
      });
    } else {
      // Show final result
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => _QuizResult(score: _score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_current]['question'];
    final options = _questions[_current]['options'] as List<String>;
    final correct = _questions[_current]['answer'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('เกมคำตอบ'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth > 700
                ? 700
                : constraints.maxWidth * 0.95;
            return SizedBox(
              width: maxWidth,
              child: Card(
                color: const Color.fromARGB(225, 255, 255, 255),
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'คำถามที่ ${_current + 1}/${_questions.length}',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(question, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      for (var option in options)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ElevatedButton(
                            onPressed: _selectedOption.isEmpty ? () => _checkAnswer(option) : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 240, 247, 253),
                              disabledBackgroundColor: option == correct
                                  ? Colors.green
                                  : option == option
                                      ? Colors.red
                                      : Colors.blue,
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _QuizResult extends StatelessWidget {
  final int score;
  const _QuizResult({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ผลการทดสอบ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('คะแนนของคุณคือ: $score', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MinigameScreen()),
                );
              },
              child: const Text('หน้าถัดไป'),
            )
          ],
        ),
      ),
    );
  }
}
