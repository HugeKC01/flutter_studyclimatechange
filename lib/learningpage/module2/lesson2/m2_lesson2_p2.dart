import 'package:flutter/material.dart';
import 'm2_lesson2_p3.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm2_lesson2_p1.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module2l2p2 extends StatelessWidget {
  const Module2l2p2({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) อธิบายโลกร้อน';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m2lesson2'] ?? 1;

    return Scaffold(
      appBar: buildAppBar(pagetitle, context),
      drawer: buildDrawer(context),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2.) ทำให้น้ำแข็งขั้วโลกละลาย ระดับน้ำทะเลสูงขึ้น และเกิดภัยพิบัติมากขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'อากาศที่ร้อนขึ้น ทำให้ก้อนน้ำแข็งใหญ่ ๆ ที่ขั้วโลกละลาย เมื่อน้ำแข็งละลาย น้ำก็จะไหลลงทะเล ทำให้ระดับน้ำทะเลสูงขึ้น เหมือนเวลาที่เราใส่น้ำแข็งในแก้วน้ำ แล้วน้ำแข็งละลาย น้ำในแก้วก็จะสูงขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เมื่อน้ำทะเลสูงขึ้น น้ำก็จะท่วมบ้านเรือนที่อยู่ใกล้ทะเล สัตว์ที่อาศัยอยู่แถวชายฝั่งก็จะไม่มีที่อยู่ นอกจากนี้ อากาศที่ร้อนขึ้นยังทำให้เกิดพายุและภัยพิบัติอื่น ๆ มากขึ้น เช่น น้ำท่วม แผ่นดินไหว และไฟป่า',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้ถุงผ้า เพื่อให้โลกของเราเย็นลง และป้องกันไม่ให้เกิดภัยพิบัติเหล่านี้มากขึ้นนะ!',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),

                                  const SizedBox(height: 24),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath:
                                          'asset/module2/m2_l2_p2_pic01.png',
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
                        builder: (context) => const Module2l2p1(),
                      ),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module2l2p3(),
                      ),
                    );
                  },
                  currentPage: 2, // Current page index
                  totalPages: totalPages, // Total number of pages
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
