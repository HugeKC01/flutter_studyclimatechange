import 'package:flutter/material.dart';
import 'm2_lesson2_p2.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm2_lesson2_p4.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module2l2p3 extends StatelessWidget {
  const Module2l2p3({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) อธิบายโลกร้อน';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m2lesson2'] ?? 1;

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
                         builder: (context) => const Module2Screen(),
                       ),
                     );
                   },
                 ),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    '3.) พื้นที่แห้งแล้งเพิ่มขึ้นและส่งผลต่อการเพาะปลูกอาหาร',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เมื่อโลกของเราร้อนขึ้น อากาศก็จะแห้งแล้งมากขึ้น ทำให้ดินแตกระแหงและปลูกพืชไม่ได้เหมือนเดิม เหมือนเวลาที่เราไม่ได้รดน้ำต้นไม้ ต้นไม้ก็จะเหี่ยวเฉาและตายไป',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เมื่อไม่มีน้ำและดินไม่ดี เกษตรกรก็ปลูกข้าว ผัก และผลไม้ไม่ได้ ทำให้เราไม่มีอาหารกิน และอาหารก็จะมีราคาแพงขึ้น เหมือนเวลาที่เราอยากกินขนม แต่ร้านค้าไม่มีขนมขาย เราก็ต้องจ่ายเงินแพงขึ้นเพื่อซื้อขนม',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้น้ำอย่างประหยัด เพื่อให้โลกของเราเย็นลง และมีอาหารกินกันอย่างเพียงพอนะ!',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 24),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath:
                                          'asset/module2/m2_l2_p3_pic01.png',
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
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module2l2p2()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module2l2p4()),
                    );
                  },
                  currentPage: 3, // Current page index
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