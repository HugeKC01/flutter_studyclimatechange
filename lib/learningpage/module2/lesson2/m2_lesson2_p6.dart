import 'package:flutter/material.dart';
import 'm2_lesson2_p7.dart';
import 'm2_lesson2_p5.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'rain_overlay.dart';
import 'LightningOverlay.dart'; // Import ไฟล์ LightningOverlay

class Module2l2p6 extends StatelessWidget {
  const Module2l2p6({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.2) อธิบายสภาพอากาศผิดฤดู';
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 237, 252),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              offset: Offset(0, 2),
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
                                        '3.) พายุและภัยธรรมชาติเกิดขึ้นบ่อยและรุนแรงมากขึ้น',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'เมื่อโลกของเราร้อนขึ้น พายุและภัยธรรมชาติก็เหมือนเพื่อนที่ไม่ดี ที่ชอบมาหาเราบ่อยขึ้น แถมยังมาแต่ละครั้งก็รุนแรงกว่าเดิม! พายุอาจจะพัดแรงจนหลังคาบ้านปลิว น้ำอาจจะท่วมสูงจนเดินทางไม่ได้ แผ่นดินอาจจะสั่นไหวรุนแรงกว่าเดิม หรือไฟป่าอาจจะลุกลามเร็วมากจนน่ากลัว เหมือนเวลาที่เราเล่นตึกต่อไม้ แล้วมีคนมาเขย่าแรง ๆ ตึกก็จะพังง่ายขึ้น',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'อากาศที่ร้อนขึ้นเป็นเหมือนตัวกระตุ้น ที่ทำให้พายุและภัยธรรมชาติเหล่านี้เกิดขึ้นบ่อยขึ้น เหมือนเวลาที่เราเติมลมลูกโป่งมากเกินไป มันก็พร้อมที่จะแตกได้ง่ายขึ้น',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และดูแลโลกของเราให้ดี เพื่อลดความเสี่ยงที่จะเกิดพายุและภัยธรรมชาติที่รุนแรงเหล่านี้กันนะ!',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 24),
                                      Center(
                                        child: component.HoverableImage(
                                          imagePath:
                                              'asset/module2/module2_learn2_pic6.png',
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
                      LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          return RainOverlay(screenWidth: constraints.maxWidth);
                        },
                      ),
                      // เพิ่ม LightningOverlay ตรงนี้
                      const LightningOverlay(
                        color: Colors.lightBlueAccent,
                        baseDuration: Duration(
                          milliseconds: 1000,
                        ), // ปรับ duration ให้เหมาะสม
                      ),
                    ],
                  ),
                ),
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2l2p5(),
                      ),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2l2p7(),
                      ),
                    );
                  },
                  currentPage: 6,
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
