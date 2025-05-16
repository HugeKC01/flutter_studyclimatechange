import 'dart:async';
import 'package:flutter/material.dart';
import 'm1_lesson2_p4.dart';

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
      if (i < fullText.length) {
        setState(() {
          displayedText += fullText[i];
          i++;
        });
      } else {
        timer.cancel();
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
    if (selected.containsAll(correctAnswers) && selected.length == correctAnswers.length) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset('asset/module1/ImageFORGAME (11).png'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Module1l2p4()),
              ),
              child: const Text('หน้าต่อไป'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset('asset/module1/ImageFORGAME (10).png'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ลองอีกครั้ง'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Container(
                        padding: const EdgeInsets.all(16), // เพิ่มระยะห่างภายในกล่อง
                        margin: const EdgeInsets.symmetric(horizontal: 20), // เพิ่มระยะห่างภายนอก
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255), // พื้นหลังสีฟ้าอ่อน
                          borderRadius: BorderRadius.circular(12), // ขอบโค้งมน
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(49, 200, 200, 200), // เงาสีเทา
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // ตำแหน่งเงา
                            ),
                          ],
                        ),
                        child: const Text(
                          'เลือกสิ่งของที่จะช่วยสมชายในการเตรียมตัวรับมือกับฝนตก 4 อย่าง',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87, // สีข้อความ
                          ),
                          textAlign: TextAlign.center, // จัดข้อความให้อยู่ตรงกลาง
                        ),
                      ),

                  
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                  ? MediaQuery.of(context).size.width * 0.2 // ถ้าด้านกว้างมากกว่าด้านยาว 2 เท่า
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
                    child: const Text('เสร็จสิ้น' ,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // สีข้อความ
                        )),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                  ? MediaQuery.of(context).size.width * 0.07 // ถ้าด้านกว้างมากกว่าด้านยาว 2 เท่า
                  : MediaQuery.of(context).size.width * 0.07, // ค่าเริ่มต้น
                    ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                    ? 4 // ถ้าด้านกว้างมากกว่าด้านยาว 2 เท่า ให้มี 4 คอลัมน์
                    : 2, // ค่าเริ่มต้น
                  childAspectRatio: 1,
                   mainAxisSpacing: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                  ? MediaQuery.of(context).size.height * 0.02 // ถ้าด้านกว้างมากกว่าด้านยาว 2 เท่า
                  : MediaQuery.of(context).size.height * 0.02, // ค่าเริ่มต้น
              crossAxisSpacing: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height * 2
                  ? MediaQuery.of(context).size.width * 0.02 // ถ้าด้านกว้างมากกว่าด้านยาว 2 เท่า
                  : MediaQuery.of(context).size.width * 0.02, // ค่าเริ่มต้น
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
                            color: sel ? const Color.fromARGB(255, 185, 255, 186)  : const Color.fromARGB(0, 247, 247, 247),
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
    );
  }

  @override
  void dispose() {
    _textTimer?.cancel();
    super.dispose();
  }
}