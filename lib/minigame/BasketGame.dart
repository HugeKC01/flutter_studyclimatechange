import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class BasketGame extends StatelessWidget {
  const BasketGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameScreen();
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double basketX = 0; // ตำแหน่ง X ของตะกร้า
  List<double> itemX = [];
  List<double> itemY = [];
  List<double> itemStartTimes = [];
  int score = 0;
  double elapsedTime = 0; // เวลาเล่นเกม
  late Timer _timer;
  bool isGameRunning = true; // เช็คว่าเกมกำลังเล่นอยู่หรือไม่
  final List<String> itemAssets = [
    'asset/basketgame/item1.png',
    'asset/basketgame/item2.png',
    'asset/basketgame/item3.png',
    'asset/basketgame/item4.png',
    'asset/basketgame/item5.png',
    'asset/basketgame/item6.png',
    'asset/basketgame/item7.png',
    'asset/basketgame/item8.png',
    'asset/basketgame/item9.png',
  ];
  final Set<int> minusScoreItems = {0, 1}; // Indexes of items that minus score (e.g., item1.png and item2.png)

  @override
  void initState() {
    super.initState();
    _initializeItems();
    _startGame();
  }

  void _initializeItems() {
    // สุ่มตำแหน่งเริ่มต้นของไอเทมและกำหนดเวลาเริ่ม
    for (int i = 0; i < itemAssets.length; i++) {
      itemX.add(Random().nextDouble() * 2 - 1); // ตำแหน่ง X สุ่ม
      itemY.add(-1); // เริ่มต้นข้างบน
      itemStartTimes.add(i * 2.0); // ไอเทมเริ่มตกห่างกัน 2 วินาที
    }
  }

  void _startGame() {
    elapsedTime = 0;
    score = 0;
    isGameRunning = true;

    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        elapsedTime += 0.016; // เพิ่มเวลาเกม (60 FPS)

        if (elapsedTime >= 60) {
          // หมดเวลา 1 นาที
          _endGame();
        }

        for (int i = 0; i < itemY.length; i++) {
          if (elapsedTime >= itemStartTimes[i]) {
            itemY[i] += 0.008; // ไอเทมเริ่มตก (ปรับให้เหมาะกับ 60 FPS)

            if (itemY[i] > 1) {
              // ถ้าตกพื้น รีเซ็ตไอเทมนั้น
              _resetItem(i);
            }

            if (itemY[i] > 0.9 && (itemX[i] - basketX).abs() < 0.2) {
              // ถ้าเก็บไอเทมได้
              if (minusScoreItems.contains(i)) {
                score = (score > 0) ? score - 1 : 0; // Minus score, not below 0
              } else {
                score++;
              }
              _resetItem(i);
            }
          }
        }
      });
    });
  }

  void _resetItem(int index) {
    itemX[index] = Random().nextDouble() * 2 - 1; // สุ่มตำแหน่ง X ใหม่
    itemY[index] = -1; // รีเซ็ตตำแหน่ง Y
    itemStartTimes[index] = elapsedTime + Random().nextDouble() * 2; // กำหนดเวลาเริ่มใหม่
  }

  void _endGame() {
    isGameRunning = false;
    _timer.cancel();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Time\'s Up!'),
        content: Text('Your score: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restartGame();
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  void _restartGame() {
    setState(() {
      basketX = 0;
      itemX.clear();
      itemY.clear();
      itemStartTimes.clear();
      _initializeItems();
    });
    _startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/overall/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.9),
              child: Text(
                'Score: $score',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.8),
              child: Text(
                'Time: ${60 - elapsedTime.toInt()}s',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            for (int i = 0; i < itemAssets.length; i++)
              if (elapsedTime >= itemStartTimes[i])
                AnimatedContainer(
                  alignment: Alignment(itemX[i], itemY[i]),
                  duration: const Duration(milliseconds: 0),
                  child: Image.asset(
                    itemAssets[i],
                    width: 50,
                    height: 50,
                  ),
                ),
            Align(
              alignment: Alignment(basketX, 0.9),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    basketX += details.delta.dx / MediaQuery.of(context).size.width * 2;
                    if (basketX > 1) basketX = 1;
                    if (basketX < -1) basketX = -1;
                  });
                },
                child: Image.asset(
                  'asset/basketgame/basket.png',
                  width: 100,
                  height: 50,
                ),
              ),
            ),
            // Floating exit button
            Positioned(
              top: 40,
              left: 20, // Move to the left
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary, // Use primary color
                shape: const CircleBorder(), // Make it a circle
                mini: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.close),
                tooltip: 'Exit',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}