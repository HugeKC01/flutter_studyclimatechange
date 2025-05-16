import 'package:flutter/material.dart';
import '../m1_main.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm1_lesson2_p2.dart';
import 'm1_lesson2_p0.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module1l2p1 extends StatelessWidget {
  const Module1l2p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) ทำไมเราต้องสนใจเรื่องนี้?';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m1lesson2'] ?? 1;

    return Scaffold(
      appBar: buildAppBar(
        'เรื่องที่ 2 ความสำคัญของการเปลี่ยนแปลงสภาพภูมิอากาศ',
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
                // Header Section
                ArticleHeader(
                   header: pageheader,
                   subtitle: pagesubtitle,
                   fontSize: fontsize,
                   onExit: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const Module1Screen(),
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
                                  const Text(
                                    '         การเปลี่ยนแปลงสภาพภูมิอากาศมีผลต่อชีวิตของมนุษย์และสิ่งแวดล้อม เช่น'
                                    ' อาหารที่เรากิน อากาศที่เราหายใจ และที่อยู่อาศัยของเรา หากเราไม่ช่วยกันลดผลกระทบ โลกอาจเผชิญกับปัญหามากขึ้นในอนาคต',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '\n1. กระทบต่อสุขภาพของเรา',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '         สภาพอากาศที่เปลี่ยนแปลงทำให้เกิดโรคที่เกี่ยวข้องกับความร้อนมากขึ้น เช่น โรคลมแดด และเพิ่มการระบาดของโรคที่มียุงเป็นพาหะอย่างไข้เลือดออกและมาลาเรีย',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module1/m1_l2_pic1.png',
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
                          builder: (context) => const Module1l2p0()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module1l2p2()),
                    );
                  },
                  currentPage: 2, // Current page index
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