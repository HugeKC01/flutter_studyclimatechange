import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson2_p2.dart';
import 'drag_and_drop_game.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'difficulty_select_page.dart';

class Module3l2p3 extends StatelessWidget {
  const Module3l2p3({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.2) วิธีปรับตัวและใช้ชีวิตต่อสภาพอากาศที่ไม่ตรงต่อฤดูกาล';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m3lesson2'] ?? 6;

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
                                    '         เคยสังเกตไหมว่า บางครั้งหน้าร้อนกลับมีฝนตกหนัก หรือหน้าหนาวกลับอากาศอุ่นผิดปกติ? นี่เป็นเพราะสภาพอากาศของโลกเราเปลี่ยนแปลงไป ทำให้ฤดูกาลไม่เป็นไปตามปกติ เช่น '
                                    'ฝนตกในช่วงที่ไม่ควรตก อากาศร้อนจัดในช่วงที่ควรจะเย็น หรือบางทีอากาศก็เปลี่ยนแปลงเร็วมากในวันเดียวกัน การที่ฤดูกาลเปลี่ยนแปลงไม่แน่นอน เราต้องรู้จักปรับตัวให้เข้ากับสภาพอากาศที่เปลี่ยนแปลง',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    พกอุปกรณ์กันฝนเสมอ เช่น ร่มหรือเสื้อกันฝน เพราะอาจมีฝนตกในช่วงที่ไม่คาดคิด',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    แต่งตัวให้เหมาะกับอากาศ เช่น ใส่เสื้อผ้าที่ระบายอากาศได้ดีและไม่หนาเกินไป',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    เช็กพยากรณ์อากาศก่อนออกจากบ้าน เช่น เช็กว่ามีโอกาสฝนตกหรือไม่ หรืออากาศจะร้อนจัดหรือไม่',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l2_p3.png',
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
                          builder: (context) => const Module3l2p2()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DifficultySelectPage()),
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