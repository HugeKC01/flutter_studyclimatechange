import 'package:flutter/material.dart';
import 'm2_lesson2_p6.dart';
import 'm2_lesson2_p4.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'snowfall_overlay_2.dart';

class Module2l2p5 extends StatelessWidget {
  const Module2l2p5({super.key});

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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
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
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '2.) ฤดูหนาวอาจสิ้นลงหรือรุนแรงขึ้นในบางพื้นที่',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'เมื่อโลกของเราร้อนขึ้น ฤดูหนาวก็อาจเปลี่ยนแปลงไปอย่างที่เราไม่เคยเจอ! บางที่อาจจะไม่มีอากาศหนาวเย็นเหมือนเมื่อก่อน หรืออาจมีฤดูหนาวที่สั้นลงจนแทบไม่รู้สึกถึงความเย็นเลย เหมือนเวลาที่เราอยากกินไอศกรีม แต่ร้านดันไม่ขายซะงั้น!',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'แต่ในบางพื้นที่ ฤดูหนาวอาจจะกลับรุนแรงมากขึ้น หนาวจัดและยาวนานกว่าเดิม ทำให้สัตว์และพืชที่เคยชินกับอากาศอบอุ่นต้องทนทุกข์ทรมาน เหมือนเวลาที่เราใส่เสื้อผ้าบาง ๆ ไปเจออากาศหนาวจัด ๆ ก็จะรู้สึกไม่สบาย',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'การเปลี่ยนแปลงเหล่านี้เกิดขึ้นเพราะโลกของเราร้อนขึ้นจากก๊าซเรือนกระจก เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ และดูแลสิ่งแวดล้อม เพื่อให้ฤดูกาลกลับมาเป็นปกติ และเราได้มีฤดูหนาวที่พอดี ๆ นะ!',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 24),
                                      Center(
                                        child: component.HoverableImage(
                                          imagePath:
                                            'asset/module2/m2_l2_p5_pic01.png',
                                      ),
                                      SizedBox(height: 12),
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
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2l2p4(),
                      ),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2l2p6(),
                      ),
                    );
                  },
                  currentPage: 5,
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
