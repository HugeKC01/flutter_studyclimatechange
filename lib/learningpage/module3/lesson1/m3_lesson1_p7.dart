import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'package:flutter/services.dart';
import 'm3_lesson1_p6.dart';
import 'm3_lesson1_p8.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'dart:math';
import 'dart:async';
import 'package:climatechange/component/animatedbackground.dart';

class Module3l1p7 extends StatelessWidget {
  const Module3l1p7({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 8;
    final pageheader = 'เรื่องที่ 4';
    final pagesubtitle = 'ขยะอิเล็กทรอนิกส์';
    const fontsize = 20.0;

    final lessons = [
      {
        'title': '1. อุปกรณ์อิเล็กทรอนิกส์ขนาดใหญ่',
        'description': 'เช่น ตู้เย็น เครื่องซักผ้า เครื่องปรับอากาศ เตาอบไมโครเวฟ เครื่องโทรทัศน์',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_l1_p7/type_01.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      },
      {
        'title': '2. อุปกรณ์อิเล็กทรอนิกส์ขนาดเล็ก',
        'description': 'เช่น โทรศัพท์มือถือ คอมพิวเตอร์ แท็บเล็ต เครื่องคิดเลข เครื่องพิมพ์',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_l1_p7/type_02.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      },
      {
        'title': '3. อุปกรณ์โทรคมนาคม',
        'description': 'เช่น โทรศัพท์บ้าน โทรศัพท์มือถือ อุปกรณ์เครือข่าย',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_l1_p7/type_03.PNG',
        'bin': 'ถังขยะ',
      },
      {
        'title': '4. เครื่องมือแพทย์',
        'description': 'เช่น เครื่องเอกซเรย์ เครื่องวัดชีพจร อุปกรณ์ผ่าตัด',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_l1_p7/type_04.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      },
      {
        'title': '5. อุปกรณ์อิเล็กทรอนิกส์อื่นๆ',
        'description': 'เช่น ถ่านไฟฉาย แบตเตอรี่ หลอดไฟ แผงวงจร',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_l1_p7/type_05.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
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
                ArticleHeader(
                   header: pageheader,
                   subtitle: pagesubtitle,
                   fontSize: fontsize,
                   onExit: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const Module3Screen(),
                       ),
                     );
                   },
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
                            Container(
                              margin: const EdgeInsets.all(12),
                              width: 500, // Smaller width
                              height: 500, // Smaller height
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: _ShakingImage(
                                imagePath: lesson['image']!,
                                borderRadius: 12,
                              ),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('ถังขยะ : ${lesson['bin']}'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module3l1p6(),
                      ),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module3l1p8(),
                      ),
                    );
                  },
                  currentPage: 7,
                  totalPages: totalPages,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          // 1 shake per second (slower)
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