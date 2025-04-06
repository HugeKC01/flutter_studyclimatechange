import 'package:flutter/material.dart';
import '../m2_main.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm2_lesson2_p2.dart';
import '../../../help.dart';
import '../../../manual.dart';
import '../../../main.dart';
import '../../../settings.dart';

class Module2l2p1 extends StatelessWidget {
  const Module2l2p1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Climate Change App'),
        elevation: 5.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Handle the button press here
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded),
              title: const Text('Manual'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Manual()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_rounded),
              title: const Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Help()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        // Background decoration for the entire screen
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/module1/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 106, 117, 142),
                            Color.fromARGB(255, 214, 237, 252),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const SizedBox(height: 12),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 214, 237, 252),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'เรื่องที่ 2',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2.1) อธิบายโลกร้อน',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 214, 237, 252),
                            Color.fromARGB(255, 75, 82, 142),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const SizedBox(height: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        color: const Color.fromARGB(200, 255, 255, 255),
                        elevation: 4,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1.) อุณหภูมิโลกเพิ่มขึ้นเนื่องมาจากก๊าซเรือนกระจกที่สะสมในบรรยากาศ',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'โลกของเราร้อนขึ้นเพราะก๊าซเรือนกระจกเยอะเกินไป! ก๊าซเหล่านี้เหมือนผ้าห่มหนา ๆ ห่อหุ้มโลก ทำให้ความร้อนออกไปไม่ได้ อุณหภูมิโลกเลยสูงขึ้น เหมือนเวลาที่เราห่มผ้าห่มหนา ๆ แล้วรู้สึกร้อนนั่นแหละ!',
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'ก๊าซเรือนกระจกมาจากหลายที่ เช่น รถยนต์ โรงงาน และการเผาขยะ เมื่อโลกของเราร้อนขึ้น น้ำแข็งขั้วโลกจะละลาย ทำให้น้ำทะเลสูงขึ้น และสัตว์หลายชนิดอาจไม่มีที่อยู่',
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้ถุงผ้า เพื่อให้โลกของเราเย็นลงนะ! เราทำได้!',
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 18),
                              ),

                              const SizedBox(height: 24),
                              Center(
                                child: HoverableImage(
                                  imagePath:
                                      'asset/module2/module2_learn2_pic1.png',
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Fixed footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 122, 255),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'btnBack',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Module2Screen(),
                              ),
                            );
                          },
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Forward button
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 122, 255),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'btnForward',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Module2l2p2(),
                              ),
                            );
                          },
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableImage extends StatefulWidget {
  final String imagePath; // เส้นทางของรูปภาพ

  const HoverableImage({super.key, required this.imagePath});

  @override
  HoverableImageState createState() => HoverableImageState();
}

class HoverableImageState extends State<HoverableImage> {
  bool _isHovered = false; // สถานะ hover หรือกดค้าง

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isHovered = true; // เมื่อกดค้าง
        });
      },
      onTapUp: (_) {
        setState(() {
          _isHovered = false; // เมื่อปล่อย
        });
      },
      onTapCancel: () {
        setState(() {
          _isHovered = false; // เมื่อยกเลิกการกด
        });
      },
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 200), // ระยะเวลาในการเปลี่ยนแปลง
        curve: Curves.easeInOut, // ลักษณะการเคลื่อนไหว
        alignment:
            _isHovered
                ? const Alignment(-0.1, 0.0) // ขยับไปทางซ้ายเล็กน้อยเมื่อ hover
                : Alignment.center, // ตำแหน่งปกติ
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ), // ระยะเวลาในการเปลี่ยนแปลง
          curve: Curves.easeInOut, // ลักษณะการเคลื่อนไหว
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // เส้นขอบสีขาว
              width: 4.0, // ความหนาของเส้นขอบ
            ),
            borderRadius: BorderRadius.circular(16.0), // กำหนดขอบมน
            boxShadow:
                _isHovered
                    ? [
                      BoxShadow(
                        color: Colors.black.withAlpha(
                          (0.2 * 255).toInt(),
                        ), // ใช้ withAlpha แทน withOpacity
                        blurRadius: 10.0,
                        offset: const Offset(0, 5),
                      ),
                    ]
                    : [],
          ),
          transform:
              _isHovered
                  ? (Matrix4.identity()..scale(1.1)) // ขยายขนาดเมื่อ hover
                  : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // กำหนดขอบมนให้กับรูปภาพ
            child: Image.asset(
              widget.imagePath, // ใช้เส้นทางรูปภาพจากพารามิเตอร์
              width:
                  MediaQuery.of(context).size.width *
                  (_isHovered ? 0.4 : 0.4), // ขยายขนาดเมื่อ hover
              fit: BoxFit.contain, // ปรับขนาดรูปภาพให้พอดี
            ),
          ),
        ),
      ),
    );
  }
}
