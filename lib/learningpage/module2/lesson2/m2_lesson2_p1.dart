import 'package:flutter/material.dart';
import '../m2_main.dart';
import 'm2_lesson2_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'snowfall_overlay_1.dart'; // ตรวจสอบชื่อไฟล์ SnowfallOverlay ของคุณ

class Module2l2p1 extends StatelessWidget {
  const Module2l2p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) อธิบายโลกร้อน';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m2lesson2'] ?? 1;

    return Scaffold(
      appBar: buildAppBar(pagetitle, context),
      drawer: buildDrawer(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(background, fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header ส่วนบน
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
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Module2Screen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
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
                // ส่วนเนื้อหาที่ต้องการให้หิมะตก
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                color: const Color.fromARGB(200, 255, 255, 255),
                                elevation: 4,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '1.) อุณหภูมิโลกเพิ่มขึ้นเนื่องมาจากก๊าซเรือนกระจกที่สะสมในบรรยากาศ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'โลกของเราร้อนขึ้นเพราะก๊าซเรือนกระจกเยอะเกินไป! ก๊าซเหล่านี้เหมือนผ้าห่มหนา ๆ ห่อหุ้มโลก ทำให้ความร้อนออกไปไม่ได้ อุณหภูมิโลกเลยสูงขึ้น เหมือนเวลาที่เราห่มผ้าห่มหนา ๆ แล้วรู้สึกร้อนนั่นแหละ!',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'ก๊าซเรือนกระจกมาจากหลายที่ เช่น รถยนต์ โรงงาน และการเผาขยะ เมื่อโลกของเราร้อนขึ้น น้ำแข็งขั้วโลกจะละลาย ทำให้น้ำทะเลสูงขึ้น และสัตว์หลายชนิดอาจไม่มีที่อยู่',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้ถุงผ้า เพื่อให้โลกของเราเย็นลงนะ! เราทำได้!',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 24),
                                      Center(
                                        child: component.HoverableImage(
                                          imagePath:
                                              'asset/module2/m2_l2_p1_pic01.png',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          return SnowfallOverlay(
                            screenWidth: constraints.maxWidth,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Footer ส่วนล่าง
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2Screen(),
                      ),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2l2p2(),
                      ),
                    );
                  },
                  currentPage: 1,
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
