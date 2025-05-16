import 'package:flutter/material.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'm3_lesson1_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module3l1p1 extends StatelessWidget {
  const Module3l1p1 ({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = 'วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพทางภูมิอากาศและการปรับตัวของมนุษย์และธรรมชาติ';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 8;

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
                                    '         วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศการเปลี่ยนแปลงสภาพภูมิอากาศเกิดจากการกระทำของมนุษย์ที่ส่งผลกระทบต่อธรรมชาติ เช่น การใช้พลังงานที่ก่อให้เกิดก๊าซเรือนกระจก การตัดไม้ทำลายป่า และการใช้ทรัพยากรธรรมชาติอย่างไม่ระมัดระวัง โดยการกระทำเหล่านี้ส่งผลให้อุณหภูมิพื้นผิวโลกสูงขึ้น ที่เรียกว่า ภาวะโลกร้อนซึ่งมีความเสี่ยงมากขึ้นที่จะเกิดสภาพอากาศรุนแรง เช่น คลื่นความร้อน ความแห้งแล้ง และ น้ำท่วม โดยในปัจจุบันความแห้งแล้งทั่วโลกได้เพิ่มสูงขึ้นมากกว่าใน 30 ปีที่ผ่านมาถึง 2 เท่า จนกลายเป็นวิกฤติโลกร้อน ที่กำลังส่งผลกระทบต่อระบบนิเวศ และการอยู่รอดของสิ่งมีชีวิตทุกๆ ชีวิตบนโลก ไม่เว้นแม้แต่ตัวมนุษย์เอง เราสามารถช่วยลดผลกระทบนี้ด้วยวิธีต่อไปนี้',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l1_p1_pic01.png',
                                    ),
                                  ),
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
                          builder: (context) => const Module3Screen()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l1p2()),
                    );
                  },
                  currentPage: 1, // Current page index
                  totalPages: totalPages,  // Total number of pages
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}