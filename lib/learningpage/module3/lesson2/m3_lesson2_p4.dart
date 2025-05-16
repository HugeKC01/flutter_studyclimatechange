import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson2_p3.dart';
import 'm3_lesson2_p5.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module3l2p4 extends StatelessWidget {
  const Module3l2p4({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.3) การปรับตัวของธรรมชาติและสิ่งมีชีวิต';
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
                                    '         ธรรมชาติรอบตัวเราเต็มไปด้วยสิ่งมีชีวิตมากมาย ตั้งแต่ต้นไม้ ดอกไม้ สัตว์เล็ก ๆ ไปจนถึงสัตว์ใหญ่ แต่ทุกสิ่งมีชีวิตต้องเผชิญกับการเปลี่ยนแปลงของสภาพแวดล้อม เช่น อากาศที่ร้อนขึ้น ฤดูกาลที่เปลี่ยนไป หรือภัยธรรมชาติที่เกิดขึ้น สิ่งมีชีวิตจึงต้อง ปรับตัว เพื่อความอยู่รอด',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),
                                  
                                  Text(
                                    '\n1. สัตว์ปรับตัวเพื่อความอยู่รอด',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '         ธรรมชาติและสิ่งมีชีวิตต่างๆ บนโลก ไม่ว่าจะเป็นต้นไม้ สัตว์ หรือแม้แต่มนุษย์ ต่างก็ต้องปรับตัวเมื่อสภาพแวดล้อมเปลี่ยนแปลงไป เช่น อากาศร้อนขึ้น หนาวจัด หรือฝนตกน้อยลง'
                                    'มาดูกันว่า สิ่งมีชีวิตในธรรมชาติมีวิธีปรับตัวอย่างไรบ้าง',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    หมีขั้วโลก มีขนหนาและชั้นไขมันใต้ผิวหนัง ช่วยให้ร่างกายอบอุ่นในที่หนาวจัด',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    นกบางชนิด จะบินอพยพไปอยู่ที่ที่อากาศอบอุ่นกว่าในฤดูหนาว',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    สัตว์บางตัว เช่น งู หรือหมี จำศีลในช่วงที่อากาศหนาวจัด เพื่อประหยัดพลังงาน',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l2_p4.png',
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
                          builder: (context) => const Module3l2p3()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l2p5()),
                    );
                  },
                  currentPage: 4, // Current page index
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