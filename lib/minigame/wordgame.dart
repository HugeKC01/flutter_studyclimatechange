import 'package:flutter/material.dart';
import 'dart:math'; // สำหรับสุ่ม
import 'dart:async'; // สำหรับ Timer

class WordMatchGamePage extends StatefulWidget {
  @override
  _WordMatchGamePageState createState() => _WordMatchGamePageState();
}

class _WordMatchGamePageState extends State<WordMatchGamePage> {
  // --- ค่าคงที่และตัวแปรสถานะ ---
  final int rows = 6;
  final int columns = 4;
  late int totalCards; // คำนวณใน initState

  // รายการคำศัพท์ (12 คำที่ไม่ซ้ำกัน เพื่อให้ได้ 24 การ์ดเมื่อทำซ้ำ)
  final List<String> vocabulary = [
    'จานโฟม', 'ช้อนพลาสติก', 'ใบไม้แห้ง', 'ก้างปลา', 'ขวดน้ำพลาสติก', 'ขวดแก้ว',
    'ถ่านไฟฉาย', 'เข็มฉีดยา', 'ถุงขนม', 'ถุงพลาสติก', 'กระดาษ', 'ฝาขวดน้ำ'
  ];

  late List<String> gameWords; // รายการคำศัพท์สำหรับการ์ดในเกม (สุ่มแล้ว)
  late List<bool> cardFliped; // สถานะการเปิดของการ์ดแต่ละใบ (true = เปิด, false = คว่ำ)
  late List<bool> cardMatched; // สถานะการจับคู่ของการ์ดแต่ละใบ (true = จับคู่แล้ว)

  int? firstCardIndex; // Index ของการ์ดใบแรกที่เลือก
  int? secondCardIndex; // Index ของการ์ดใบที่สองที่เลือก
  bool isChecking = false; // สถานะ: กำลังรอตรวจสอบการจับคู่ (ป้องกันการกดรัว)
  int pairsFound = 0; // จำนวนคู่ที่หาเจอ
  int moves = 0; // จำนวนครั้งที่เปิดการ์ด (นับเป็นคู่)

  Timer? _timer; // Timer สำหรับหน่วงเวลาก่อนปิดการ์ดที่ไม่ตรงกัน

  // --- เมธอด ---

  @override
  void initState() {
    super.initState();
    totalCards = rows * columns;
    _initializeGame();
  }

  @override
  void dispose() {
    _timer?.cancel(); // ยกเลิก Timer ถ้ายังทำงานอยู่เมื่อ Widget ถูกทำลาย
    super.dispose();
  }

  // ฟังก์ชันเริ่มต้นเกม / รีเซ็ตเกม
  void _initializeGame() {
    setState(() {
      // 1. สร้างรายการคำศัพท์สำหรับเกม: ทำซ้ำคำศัพท์และสุ่ม
      List<String> duplicatedWords = [...vocabulary, ...vocabulary];
      duplicatedWords.shuffle(Random()); // สุ่มลำดับคำศัพท์
      gameWords = duplicatedWords;

      // 2. รีเซ็ตสถานะการ์ดทั้งหมด
      cardFliped = List.filled(totalCards, false); // คว่ำการ์ดทั้งหมด
      cardMatched = List.filled(totalCards, false); // ยังไม่มีการ์ดไหนจับคู่

      // 3. รีเซ็ตตัวแปรควบคุมเกม
      firstCardIndex = null;
      secondCardIndex = null;
      isChecking = false;
      pairsFound = 0;
      moves = 0;
      _timer?.cancel(); // ยกเลิก Timer เก่า (ถ้ามี)
    });
  }

  // ฟังก์ชันเมื่อการ์ดถูกแตะ
  void _onCardTap(int index) {
    // ไม่ทำอะไรถ้า:
    // - กำลังรอตรวจสอบ (isChecking)
    // - การ์ดใบนั้นเปิดอยู่แล้ว หรือ จับคู่ไปแล้ว
    // - เลือกการ์ดใบเดิมซ้ำเป็นใบที่สอง
    if (isChecking || cardFliped[index] || cardMatched[index] || index == firstCardIndex) {
      return;
    }

    setState(() {
      cardFliped[index] = true; // เปิดการ์ดที่แตะ

      if (firstCardIndex == null) {
        // นี่คือการ์ดใบแรกที่เลือกในรอบนี้
        firstCardIndex = index;
      } else {
        // นี่คือการ์ดใบที่สองที่เลือก
        secondCardIndex = index;
        isChecking = true; // เริ่มสถานะรอตรวจสอบ
        moves++; // นับจำนวนครั้งที่พยายามจับคู่

        // หน่วงเวลาเล็กน้อยเพื่อให้ผู้เล่นเห็นการ์ดใบที่สอง
        _timer = Timer(Duration(milliseconds: 800), _checkMatch);
      }
    });
  }

  // ฟังก์ชันตรวจสอบการจับคู่ (หลังจากหน่วงเวลา)
  void _checkMatch() {
    // ตรวจสอบเพื่อให้แน่ใจว่า index ไม่ใช่ null (อาจเกิดขึ้นได้ในกรณีที่ Widget ถูก dispose)
    if (firstCardIndex == null || secondCardIndex == null) {
      setState(() {
        isChecking = false; // หยุดการรอตรวจสอบ
      });
      return;
    }

    int index1 = firstCardIndex!;
    int index2 = secondCardIndex!;

    setState(() {
      if (gameWords[index1] == gameWords[index2]) {
        // ---- จับคู่สำเร็จ ----
        cardMatched[index1] = true;
        cardMatched[index2] = true;
        pairsFound++;

        // ตรวจสอบว่าจบเกมหรือยัง
        if (pairsFound == vocabulary.length) {
          _showGameEndDialog();
        }
      } else {
        // ---- จับคู่ไม่สำเร็จ ----
        // พลิกการ์ดกลับไปเป็นสถานะคว่ำ
        cardFliped[index1] = false;
        cardFliped[index2] = false;
      }

      // รีเซ็ตการเลือกสำหรับการ์ดรอบถัดไป
      firstCardIndex = null;
      secondCardIndex = null;
      isChecking = false; // หยุดการรอตรวจสอบ
    });
  }

  // แสดง Dialog เมื่อจบเกม
  void _showGameEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // ไม่ให้ปิด dialog โดยการแตะข้างนอก
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ยินดีด้วย!'),
          content: Text('คุณจับคู่คำศัพท์ได้ครบทั้งหมดใน $moves ครั้ง!'),
          actions: <Widget>[
            TextButton(
              child: Text('เล่นอีกครั้ง'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Dialog
                _initializeGame(); // เริ่มเกมใหม่
              },
            ),
          ],
        );
      },
    );
  }

  // --- ส่วนแสดงผล (UI) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เกมจับคู่คำศัพท์ (4x6)'),
        actions: [
           // ปุ่มสำหรับรีสตาร์ทเกมบน AppBar
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _initializeGame,
            tooltip: 'เริ่มเกมใหม่',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ส่วนแสดงข้อมูล (จำนวนคู่ที่เจอ, จำนวนครั้งที่เปิด)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('คู่ที่เจอ: $pairsFound / ${vocabulary.length}', style: TextStyle(fontSize: 18)),
                  Text('จำนวนครั้ง: $moves', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            // ส่วนแสดงการ์ดเกม
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns, // จำนวนคอลัมน์
                  crossAxisSpacing: 6.0, // ระยะห่างแนวนอน
                  mainAxisSpacing: 6.0, // ระยะห่างแนวตั้ง
                ),
                itemCount: totalCards, // จำนวนการ์ดทั้งหมด
                itemBuilder: (context, index) {
                  return _buildCard(index); // สร้าง Widget สำหรับการ์ดแต่ละใบ
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget สำหรับสร้างการ์ดแต่ละใบ
  Widget _buildCard(int index) {
    bool isFlipped = cardFliped[index];
    bool isMatched = cardMatched[index];
    String word = gameWords[index];

    // Widget ที่แสดงเมื่อการ์ดคว่ำอยู่
    Widget cardBack = Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Center(
        child: Icon(Icons.question_mark, size: 40, color: Colors.white),
      ),
    );

    // Widget ที่แสดงเมื่อการ์ดเปิดอยู่ (แสดงคำศัพท์)
    Widget cardFront = Container(
       decoration: BoxDecoration(
        color: isMatched ? Colors.lightGreen[100] : Colors.white, // สีพื้นหลังเปลี่ยนเมื่อจับคู่แล้ว
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: isMatched ? Colors.green : Colors.blue),
      ),
      child: Center(
        child: Text(
          word,
          textAlign: TextAlign.center,
          style: TextStyle(
             fontSize: 18.0,
             fontWeight: FontWeight.bold,
             color: isMatched ? Colors.green[800] : Colors.black87,
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () => _onCardTap(index), // กำหนดการทำงานเมื่อแตะการ์ด
      child: AnimatedSwitcher( // ใช้ AnimatedSwitcher เพื่อให้มี effect ตอนพลิก (ง่ายๆ)
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
           // อาจจะเพิ่ม animation ที่ซับซ้อนขึ้นได้ เช่น FlipAnimation
           return ScaleTransition(child: child, scale: animation);
        },
        child: isFlipped || isMatched
            ? cardFront // แสดงด้านหน้าถ้าเปิดหรือจับคู่แล้ว
            : cardBack, // แสดงด้านหลังถ้าคว่ำอยู่
        // ใช้ key เพื่อให้ AnimatedSwitcher รู้ว่า Widget เปลี่ยนไปจริงๆ
        key: ValueKey<bool>(isFlipped || isMatched),
      ),
    );
  }
}