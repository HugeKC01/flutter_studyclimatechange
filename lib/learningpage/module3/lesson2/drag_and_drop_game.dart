import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'm3_lesson2_p4.dart';

class WordArrangeGame extends StatefulWidget {
  final String difficultyLevel;
  final bool challengeMode;
  const WordArrangeGame({Key? key, required this.difficultyLevel, required this.challengeMode}) : super(key: key);

  @override
  _WordArrangeGameState createState() => _WordArrangeGameState();
}

class _WordArrangeGameState extends State<WordArrangeGame> {
  final List<Map<String, dynamic>> stages = [
    {
      'target': 'ฉันรักธรรมชาติ',
      'words': ['ฉัน', 'รัก', 'ธรรมชาติ', 'แมว', 'กิน', 'ข้าว'],
      'explanation': 'ประโยคนี้หมายถึงการแสดงความรักต่อธรรมชาติ',
    },
    {
      'target': 'อากาศร้อนทำให้เหงื่อออก',
      'words': ['อากาศ', 'ร้อน', 'ทำให้', 'เหงื่อ', 'ออก', 'ฝน', 'ตก'],
      'explanation': 'ประโยคนี้อธิบายผลของอากาศร้อนที่ทำให้ร่างกายมีเหงื่อ',
    },
    {
      'target': 'เราควรช่วยกันรักษาสิ่งแวดล้อม',
      'words': ['เราควร', 'ช่วยกัน', 'รักษา', 'สิ่งแวดล้อม', 'เล่น', 'ฟุตบอล'],
      'explanation': 'ประโยคนี้สื่อถึงการร่วมมือกันดูแลสิ่งแวดล้อม',
    },
    {
      'target': 'ต้นไม้ช่วยดูดซับคาร์บอนไดออกไซด์',
      'words': ['ต้นไม้', 'ช่วย', 'ดูดซับ', 'คาร์บอนไดออกไซด์', 'รถ', 'บ้าน'],
      'explanation': 'ต้นไม้มีบทบาทสำคัญในการดูดซับก๊าซคาร์บอนไดออกไซด์',
    },
    {
      'target': 'ฝนตกทำให้ถนนลื่น',
      'words': ['ฝน', 'ตก', 'ทำให้', 'ถนน', 'ลื่น', 'ไฟ'],
      'explanation': 'ฝนตกอาจทำให้ถนนลื่นและเกิดอุบัติเหตุได้',
    },
    {
      'target': 'การรีไซเคิลช่วยลดขยะ',
      'words': ['การรีไซเคิล', 'ช่วย', 'ลด', 'ขยะ', 'น้ำ', 'ลม'],
      'explanation': 'การรีไซเคิลเป็นวิธีหนึ่งที่ช่วยลดปริมาณขยะ',
    },
    {
      'target': 'ควรปิดไฟเมื่อไม่ใช้งาน',
      'words': ['ควร', 'ปิด', 'ไฟ', 'เมื่อ', 'ไม่', 'ใช้งาน', 'ต้นไม้'],
      'explanation': 'การปิดไฟเมื่อไม่ใช้งานช่วยประหยัดพลังงาน',
    },
    {
      'target': 'ขยะพลาสติกเป็นอันตรายต่อสัตว์ทะเล',
      'words': ['ขยะ', 'พลาสติก', 'เป็น', 'อันตราย', 'ต่อ', 'สัตว์', 'ทะเล', 'บ้าน'],
      'explanation': 'ขยะพลาสติกส่งผลกระทบต่อสิ่งแวดล้อมและสัตว์ทะเล',
    },
    {
      'target': 'เราควรปลูกต้นไม้เพิ่ม',
      'words': ['เราควร', 'ปลูก', 'ต้นไม้', 'เพิ่ม', 'ข้าว', 'รถ'],
      'explanation': 'การปลูกต้นไม้ช่วยเพิ่มพื้นที่สีเขียวและลดโลกร้อน',
    },
    {
      'target': 'อากาศบริสุทธิ์ดีต่อสุขภาพ',
      'words': ['อากาศ', 'บริสุทธิ์', 'ดี', 'ต่อ', 'สุขภาพ', 'ฝน'],
      'explanation': 'อากาศบริสุทธิ์ช่วยให้สุขภาพดีขึ้น',
    },
  ];

  late List<Map<String, dynamic>> gameStages;
  late String difficultyLevel;
  late bool challengeMode;
  int currentStage = 0;
  List<String> selectedWords = [];
  List<bool> usedWords = [];
  int score = 0;
  int highScore = 0;
  int timeLeft = 60;
  Timer? _timer;
  bool gameEnded = false;
  String feedback = '';
  int totalGames = 0;
  int totalScore = 0;
  int totalCorrect = 0;
  int totalQuestions = 0;
  bool hintUsed = false;

  @override
  void initState() {
    super.initState();
    difficultyLevel = widget.difficultyLevel;
    challengeMode = widget.challengeMode;
    setupGame();
    startTimer();
  }

  void setupGame() {
    gameStages = List<Map<String, dynamic>>.from(stages.map((e) => Map<String, dynamic>.from(e)));
    int numQuestions = gameStages.length;
    int wordBankExtra = 0;
    int baseTime = 60;
    if (difficultyLevel == 'easy') {
      numQuestions = 5;
      wordBankExtra = 0;
      baseTime = 80;
    } else if (difficultyLevel == 'normal') {
      numQuestions = 7;
      wordBankExtra = 1;
      baseTime = 60;
    } else if (difficultyLevel == 'hard') {
      numQuestions = 10;
      wordBankExtra = 3;
      baseTime = 40;
    }
    gameStages.shuffle(Random());
    gameStages = gameStages.take(numQuestions).toList();
    for (var stage in gameStages) {
      List<String> baseWords = List<String>.from(stage['words']);
      if (wordBankExtra > 0) {
        // เพิ่มคำสุ่มที่ไม่เกี่ยวข้อง
        List<String> distractors = ['แมว', 'กิน', 'ข้าว', 'ฝน', 'ตก', 'เล่น', 'ฟุตบอล', 'บ้าน', 'รถ', 'ต้นไม้', 'น้ำ', 'ไฟ', 'ดิน', 'ลม'];
        distractors.removeWhere((w) => baseWords.contains(w));
        distractors.shuffle(Random());
        baseWords.addAll(distractors.take(wordBankExtra));
      }
      baseWords.shuffle(Random());
      stage['words'] = baseWords;
    }
    if (challengeMode) baseTime -= 20;
    timeLeft = baseTime;
    currentStage = 0;
    selectedWords.clear();
    usedWords = List.filled(gameStages[0]['words'].length, false);
    feedback = '';
    gameEnded = false;
    hintUsed = false;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          endGame();
        }
      });
    });
  }

  void endGame() {
    _timer?.cancel();
    setState(() {
      gameEnded = true;
      totalGames++;
      totalScore += score;
      totalQuestions += stages.length;
      totalCorrect += score ~/ 30;
      if (score > highScore) highScore = score;
    });
  }

  void selectWord(int idx) {
    if (usedWords[idx] || gameEnded) return;
    setState(() {
      selectedWords.add(gameStages[currentStage]['words'][idx]);
      usedWords[idx] = true;
    });
  }

  void removeWord(int idx) {
    if (gameEnded) return;
    String word = selectedWords[idx];
    int wordIdx = gameStages[currentStage]['words'].indexOf(word);
    setState(() {
      selectedWords.removeAt(idx);
      if (wordIdx != -1) usedWords[wordIdx] = false;
    });
  }

  void useHint() {
    if (gameEnded || selectedWords.length >= gameStages[currentStage]['target'].toString().split('').length) return;
    String target = gameStages[currentStage]['target'];
    List<String> targetWords = [];
    // แยกคำใน target ตามที่มีใน word bank
    for (var w in gameStages[currentStage]['words']) {
      if (target.contains(w) && !selectedWords.contains(w)) {
        targetWords.add(w);
      }
    }
    // หาคำถัดไปที่ควรเลือก
    for (var w in targetWords) {
      if (!selectedWords.contains(w)) {
        int idx = gameStages[currentStage]['words'].indexOf(w);
        if (idx != -1 && !usedWords[idx]) {
          setState(() {
            selectedWords.add(w);
            usedWords[idx] = true;
            hintUsed = true;
          });
          break;
        }
      }
    }
  }

  void submit() {
    if (gameEnded) return;
    String answer = selectedWords.join('');
    String target = gameStages[currentStage]['target'];
    String explanation = gameStages[currentStage]['explanation'] ?? '';
    if (answer == target) {
      int stageScore = selectedWords.length * 10;
      setState(() {
        score += stageScore;
        feedback = 'ถูกต้อง! +$stageScore คะแนน\n\nเฉลย: $target\n$explanation';
      });
      Future.delayed(const Duration(seconds: 2), () {
        nextStage();
      });
    } else {
      setState(() {
        feedback = 'ยังไม่ถูกต้อง ลองใหม่!\n\nเฉลย: $target\n$explanation';
      });
      Future.delayed(const Duration(seconds: 2), () {
        nextStage();
      });
    }
  }

  void nextStage() {
    if (currentStage < gameStages.length - 1) {
      setState(() {
        currentStage++;
        selectedWords.clear();
        usedWords = List.filled(gameStages[currentStage]['words'].length, false);
        feedback = '';
        hintUsed = false;
      });
    } else {
      endGame();
    }
  }

  void restart() {
    setState(() {
      setupGame();
      score = 0;
      hintUsed = false;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stage = gameStages[currentStage];
    return Scaffold(
      appBar: buildAppBar('เกมเรียงคำ', context),
      drawer: buildDrawer(context),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('คะแนน: $score', style: const TextStyle(fontSize: 18)),
                  Text('เวลาที่เหลือ: $timeLeft', style: const TextStyle(fontSize: 18)),
                  Text('สูงสุด: $highScore', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            if (!gameEnded) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('แตะเลือกคำเพื่อเรียงเป็นประโยคที่ถูกต้อง', style: const TextStyle(fontSize: 16)),
              ),
              Wrap(
                spacing: 8,
                children: List.generate(stage['words'].length, (i) {
                  return ChoiceChip(
                    label: Text(stage['words'][i]),
                    selected: usedWords[i],
                    onSelected: (_) => selectWord(i),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 8,
                children: List.generate(selectedWords.length, (i) {
                  return InputChip(
                    label: Text(selectedWords[i]),
                    onDeleted: () => removeWord(i),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: hintUsed ? null : useHint,
                    icon: const Icon(Icons.lightbulb_outline),
                    label: const Text('ขอคำใบ้'),
                  ),
                  if (hintUsed)
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('ใช้คำใบ้ไปแล้ว', style: TextStyle(color: Colors.orange)),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: selectedWords.isNotEmpty ? submit : null,
                child: const Text('ส่งคำตอบ'),
              ),
              if (feedback.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(feedback, style: const TextStyle(fontSize: 16, color: Colors.blue)),
                ),
            ] else ...[
              const SizedBox(height: 32),
              Text('จบเกม! คะแนนของคุณ: $score', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text('ประโยคที่ถูกต้อง: ${gameStages[currentStage]['target']}', style: const TextStyle(fontSize: 16)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(gameStages[currentStage]['explanation'], style: const TextStyle(fontSize: 15, color: Colors.green)),
              ),
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('สถิติการเล่น', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('จำนวนรอบที่เล่น: $totalGames'),
                      Text('คะแนนสูงสุด: $highScore'),
                      Text('คะแนนเฉลี่ย: ${totalGames > 0 ? (totalScore / totalGames).toStringAsFixed(1) : 0}'),
                      Text('อัตราการตอบถูก: ${totalQuestions > 0 ? ((totalCorrect / totalQuestions) * 100).toStringAsFixed(1) : 0}%'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: restart,
                child: const Text('เริ่มใหม่'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Module3l2p4(),
                    ),
                  );
                },
                child: const Text('ไปหน้าต่อไป'),
              ),
            ],
            const Spacer(),
            FooterNavigation(
              onBackPressed: () => Navigator.pop(context),
              onForwardPressed: () {},
              currentPage: currentStage + 1,
              totalPages: gameStages.length,
            ),
          ],
        ),
      ),
    );
  }
}