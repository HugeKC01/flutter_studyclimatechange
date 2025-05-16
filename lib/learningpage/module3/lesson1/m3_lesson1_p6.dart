import 'package:climatechange/checkpoint/checkpoint.dart';
import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'package:flutter/services.dart';
import 'm3_lesson1_p5.dart';
import 'm3_lesson1_p7.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'dart:math'; // Add this at the top with other imports

class Module3l1p6 extends StatelessWidget {
  const Module3l1p6({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 8;
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = 'ประเภทของพลาสติกและการรีไซเคิล';

    final lessons = [
      {
        'title': '1. พลาสติกประเภทที่ 1 สัญลักษณ์ 1 และ PET',
        'description': 'มีความใส เหนียว ทนทาน และป้องกันการแพร่ผ่านของก๊าซได้ดี เช่น แก้วใส ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_l1_p6/01_pet.PNG',
      },
      {
        'title': '2. พลาสติกประเภทที่ 2 สัญลักษณ์ 2 และ HDPE',
        'description': 'มีความหนาแน่นสูง แข็งแรง สีขุ่นหรือสีทึบ เช่น ถุงหูหิ้ว ถุงขยะ',
        'recycle': 'นำไปรีไซเคิลเป็นเฟอร์นิเจอร์ ศาลา ม้านั่ง',
        'image': 'asset/module3/m3_l1_p6/02_hdpe.PNG',
      },
      {
        'title': '3. พลาสติกประเภทที่ 3 สัญลักษณ์ 3 และ PVC',
        'description': 'มีความแข็งแรง ไอน้ำและอากาศสามารถซึมผ่านได้ และป้องกันไขมันได้ดี เช่น ท่อน้ำประปา ขวดสบู่ ขวดแชมพู อุปกรณ์การแพทย์ ผ้าม่านห้องน้ำ',
        'recycle': 'นำไปรีไซเคิลเป็นท่อประปาทางการเกษตรและกรวยจราจร',
        'image': 'asset/module3/m3_l1_p6/03_pvc.PNG',
      },
      {
        'title': '4. พลาสติกประเภทที่ 4 สัญลักษณ์ 4 และ LDPE',
        'description': 'โปร่งแสง ความหนาแน่นต่ำ ยืดหยุ่นได้ เช่น ถุงบรรจุอาหารแช่แข็ง แผ่นฟิล์มห่ออาหาร',
        'recycle': 'นำไปรีไซเคิลเป็นถุงใส่ขยะ',
        'image': 'asset/module3/m3_l1_p6/04_ldpe.PNG',
      },
      {
        'title': '5. พลาสติกประเภทที่ 5 สัญลักษณ์ 5 และ PP',
        'description': 'น้ำหนักเบา แข็งแรง ทนทาน และทนความร้อนได้ดี เช่น แก้วแข็ง หลอด ถุงบรรจุอาหาร กล่องบรรจุอาหาร ถ้วยโยเกิร์ต ถ้วยบะหมี่กึ่งสำเร็จรูป ฝาขวดน้ำ',
        'recycle': 'นำไปรีไซเคิลเป็นจานรองแก้ว กล่องแบตเตอรี่รถยนต์',
        'image': 'asset/module3/m3_l1_p6/05_pp.PNG',
      },
      {
        'title': '6. พลาสติกประเภทที่ 6 สัญลักษณ์ 6 และ PS',
        'description': 'มีความโปร่งใส แข็งแรง แต่เปราะบาง ผลิตเป็นรูปต่าง ๆ ได้ง่าย เช่น ช้อน ส้อม ถ้วย จาน กล่องเบเกอรี่และกล่องโฟม',
        'recycle': 'นำไปรีไซเคิลเป็นจานรองแก้ว และหากโฟมนำไปบดแล้วสามารถนำไปผสมกับเม็ดโฟมใหม่ แล้วนำไปผลิตเป็นโฟมซ้ำได้อีก',
        'image': 'asset/module3/m3_l1_p6/06_ps.PNG',
      },
      {
        'title': '7. พลาสติกประเภทที่ 7 Other สัญลักษณ์ 7 และ OTHER',
        'description': 'เป็นพลาสติกที่ไม่ใช่ 6 ชนิดแรก มีการผสมของพลาสติกและสารหลายชนิด จะนำไปรีไซเคิลค่อนข้างยาก เพราะจะไม่ทราบว่าเป็นพลาสติกชนิดใดผสมอยู่',
        'recycle': 'จะนำไปรีไซเคิลค่อนข้างยาก เพราะจะไม่ทราบว่าเป็นพลาสติกชนิดใดผสมอยู่',
        'image': 'asset/module3/m3_l1_p6/07_other.PNG',
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        pagetitle,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Adjust the opacity value as needed
              child: Image.asset(
                background, // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
        child: Column(
          children: [
            Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 237, 252),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.white, // Background color for the button
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black, // Shadow color
                          blurRadius: 4, // Blur radius for the shadow
                          offset: const Offset(0, 2), // Shadow offset
                          ),
                        ],
                        ),
                        child: IconButton(
                        icon: const Icon(Icons.exit_to_app, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                    builder: (context) => const Module3Screen()
                              ),
                            );  // Exit the current page
                        },
                        ),
                      ),
                      const SizedBox(width: 20), // Add spacing between the icon and the header
                      Expanded( // Ensures the text wraps into a new line
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pageheader,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              pagesubtitle,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            Expanded(
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  final lesson = lessons[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            // Calculate image width as 130% of the image height (or content)
                            final double imageHeight = 120;
                            final double imageWidth = imageHeight * 1.3;

                            return Container(
                              margin: const EdgeInsets.all(12),
                              width: imageWidth,
                              height: imageHeight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue, // Blue border
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: _ShakingImage(
                                imagePath: lesson['image']!,
                                borderRadius: 12,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lesson['title']!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(lesson['description']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('การรีไซเคิล : ${lesson['recycle']}'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Back and Forward buttons
            FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l1p5()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l1p7()),
                    );
                  },
                  currentPage: 6, // Current page index
                  totalPages: totalPages,  // Total number of pages
                ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

// Add this widget below your Module3l1p6 class
class _ShakingImage extends StatefulWidget {
  final String imagePath;
  final double borderRadius;
  const _ShakingImage({required this.imagePath, this.borderRadius = 12, super.key});

  @override
  State<_ShakingImage> createState() => _ShakingImageState();
}

class _ShakingImageState extends State<_ShakingImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
  }

  void _onEnter(PointerEnterEvent event) {
    setState(() => _hovering = true);
    _controller.repeat();
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _hovering = false);
    _controller.stop();
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Shake amplitude in pixels
          final double amplitude = 12;
          // 1 shake per second (slow shake)
          final double shakesPerSecond = 1;
          final double shake = _hovering
              ? sin(_controller.value * 2 * pi * shakesPerSecond) * amplitude
              : 0.0;
          return Transform.translate(
            offset: Offset(shake, 0),
            child: child,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}