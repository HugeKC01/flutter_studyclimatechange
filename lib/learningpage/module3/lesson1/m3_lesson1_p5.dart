import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'm3_lesson1_p4.dart';
import 'm3_lesson1_p6.dart';

class Module3l1p5 extends StatelessWidget {
  const Module3l1p5 ({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.1.1) ขยะในครัว';
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
                                    '• เศษอาหาร',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '         ควรนำไปทำปุ๋ยหมักหรือนำไปเลี้ยงสัตว์เพื่อลดขยะอินทรีย์ (ทิ้งในขยะอินทรีย์ - สีเขียว)',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l1_p5_pic01.png',
                                    ),
                                  ),
                                  Text(
                                    '• น้ำมันที่ใช้แล้ว',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '         รอให้เย็นแล้วเทใส่ขวด นำไปทิ้งที่ถังขยะทั่วไป (สีน้ำเงิน) หรือจะนำไปบริจาคหรือขายให้กับสถานที่รับซื้อน้ำมันใช้แล้วเพื่อแปรรูปน้ำมันไบโอดีเซล',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l1_p5_pic02.png',
                                    ),
                                  ),
                                  Text(
                                    '• กล่องโฟม',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '         หลีกเลี่ยงการใช้หากเป็นไปได้ เพราะย่อยสลายยาก ควรแยกทิ้งในถังขยะทั่วไป (สีน้ำเงิน) หรือจุดรับกำจัดขยะโฟมโดยเฉพาะ',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l1_p5_pic03.png',
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
                          builder: (context) => const Module3l1p4()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l1p6()),
                    );
                  },
                  currentPage: 5, // Current page index
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