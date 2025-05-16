import 'dart:async';
import 'package:flutter/material.dart';
import '../../../minigame_main.dart';

class Module1l2MiniGame extends StatefulWidget {
  const Module1l2MiniGame({super.key});

  @override
  State<Module1l2MiniGame> createState() => _Module1l2MiniGameState();
}

class _Module1l2MiniGameState extends State<Module1l2MiniGame> with SingleTickerProviderStateMixin {
  final List<String> dialogues = [
    'สวัสดีครับทุกคน!!',
    'ช่วงนี้สภาพอากาศเปลี่ยนแปลงบ่อย ฝนตกไม่เป็นฤดู',
    'อยากให้ทุกคนช่วยผมจัดกระเป๋านักเรียนหน่อยครับ ว่าต้องเตรียมอะไรบ้าง',
    'เพื่อให้พร้อมรับมือกับฝนตกที่อาจจะเกิดขึ้นจากสภาพอากาศที่เปลี่ยนแปลง',
  ];
  int dialogueIndex = 0;
  bool showGame = false;

  final List<Map<String, String>> options = [
    {'img': 'asset/module1/ImageFORGAME (3).PNG', 'desc': 'เบ็กตกปลา'},
    {'img': 'asset/module1/ImageFORGAME (4).PNG', 'desc': 'ร่มกันฝน'},
    {'img': 'asset/module1/ImageFORGAME (7).PNG', 'desc': 'ถุงดำ'},
    {'img': 'asset/module1/ImageFORGAME (5).PNG', 'desc': 'รองเท้าบูท'},
    {'img': 'asset/module1/ImageFORGAME (8).PNG', 'desc': 'ห่วงยาง'},
    {'img': 'asset/module1/ImageFORGAME (1).PNG', 'desc': 'เสื้อกันฝน'},
    {'img': 'asset/module1/ImageFORGAME (9).PNG', 'desc': 'รองเท้าแตะ'},
    {'img': 'asset/module1/ImageFORGAME (6).PNG', 'desc': 'แว่นตาดำน้ำ'},
  ];

  // Correct answers (zero-based indices): Umbrella(1), Black Bag(2),
  // Raincoat(5), Sandals(6).
  final Set<int> correctAnswers = {1, 2, 5, 6};
  final Set<int> selected = {};

  late AnimationController _imageController;
  late Animation<double> _imageAnimation;
  String displayedText = '';
  Timer? _textTimer; // Add this field

  @override
  void initState() {
    super.initState();
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100), // ลดระยะเวลาเพื่อให้เร็วขึ้น
    )..repeat(reverse: true);
    _imageAnimation = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeInOut),
    );
    startTextAnimation();
  }

  void startTextAnimation() {
    _textTimer?.cancel();
    displayedText = '';
    final fullText = dialogues[dialogueIndex];
    int i = 0;
    _textTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
        _textTimer = null;
        return;
      }
      if (i < fullText.length) {
        setState(() {
          displayedText += fullText[i];
          i++;
        });
      } else {
        timer.cancel();
        _textTimer = null;
      }
    });
  }

  void nextDialogue() {
    setState(() {
      if (dialogueIndex < dialogues.length - 1) {
        dialogueIndex++;
        startTextAnimation();
      } else {
        showGame = true;
      }
    });
  }

  void toggleSelection(int index) {
    setState(() {
      if (selected.contains(index)) {
        selected.remove(index);
      } else {
        selected.add(index);
      }
    });
  }

  void finishSelection() {
    final parentContext = context;
    if (selected.containsAll(correctAnswers) && selected.length == correctAnswers.length) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(parentContext).size.width * 0.6,
            child: Image.asset('asset/module1/ImageFORGAME (11).png'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                if (!mounted) return;
                Navigator.pushReplacement(
                  parentContext,
                  MaterialPageRoute(builder: (context) => const MinigameScreen()),
                );
              },
              child: const Text('หน้าต่อไป'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(parentContext).size.width * 0.6,
            child: Image.asset('asset/module1/ImageFORGAME (10).png'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('ลองอีกครั้ง'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เกมสมชาย'),
        actions: [
          // สามารถเพิ่ม action อื่นๆ ได้ที่นี่
        ],
      ),
      body: Center(
        child: !showGame
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // สร้างกล่องข้อความสวยๆ
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      displayedText,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Transform.translate(
                    offset: Offset(0, _imageAnimation.value),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset('asset/module1/ImageFORGAME.PNG'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: nextDialogue,
                    child: const Text('ถัดไป'),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: const Color.fromARGB(225, 255, 255, 255),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(49, 200, 200, 200),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Text(
                                'เลือกสิ่งของที่จะช่วยสมชายในการเตรียมตัวรับมือกับฝนตก 4 อย่าง',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                                  ? MediaQuery.of(context).size.width * 0.2
                                  : MediaQuery.of(context).size.width * 0.25,
                              child: Image.asset('asset/module1/ImageFORGAME (2).PNG'),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: finishSelection,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 0, 136, 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                              child: const Text('เสร็จสิ้น',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            const SizedBox(height: 20),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                                    ? MediaQuery.of(context).size.width * 0.07
                                    : MediaQuery.of(context).size.width * 0.07,
                              ),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                                    ? 4
                                    : 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                                    ? MediaQuery.of(context).size.height * 0.02
                                    : MediaQuery.of(context).size.height * 0.02,
                                crossAxisSpacing: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                                    ? MediaQuery.of(context).size.width * 0.02
                                    : MediaQuery.of(context).size.width * 0.02,
                              ),
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final sel = selected.contains(index);
                                return GestureDetector(
                                  onTap: () => toggleSelection(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: sel ? const Color.fromARGB(255, 0, 167, 6) : Colors.grey,
                                        width: sel ? 3 : 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      color: sel
                                          ? const Color.fromARGB(255, 185, 255, 186)
                                          : const Color.fromARGB(0, 247, 247, 247),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.1,
                                          child: Image.asset(options[index]['img']!),
                                        ),
                                        Text(options[index]['desc']!),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _textTimer?.cancel();
    _textTimer = null;
    _imageController.dispose(); // Properly dispose the AnimationController
    super.dispose();
  }
}