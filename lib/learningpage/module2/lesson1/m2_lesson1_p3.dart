import 'package:flutter/material.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/learningpage/module2/lesson2/m2_lesson2_p1.dart';
import 'm2_lesson1_p2.dart'; // Import m3_learn2_p2.dart file where the next screen is defined.
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/dialog.dart';
import 'package:climatechange/component/page_config.dart';

class Module2l1p3 extends StatelessWidget {
  const Module2l1p3({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 สาเหตุของการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.1) สาเหตุของการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m2lesson1'] ?? 1;

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
                                    'สาเหตุของการเปลี่ยนแปลงสภาพอากาศจากฝีมือของมนุษย์',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '\n3. สาเหตุจากกิจกรรมการเกษตร',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '\n - การเผาพื้นที่การเกษตรเพื่อเตรียมพื้นที่เพาะปลูก ทำให้เกิดควันและก๊าซเรือนกระจก'
                                    '\n - การใช้ปุ๋ยเคมีและสารกำจัดศัตรูพืชทำให้เกิดมลพิษทางน้ำและดิน'
                                    '\n - การเลี้ยงสัตว์ เช่น วัวและแกะ ทำให้เกิดก๊าซมีเทนซึ่งเป็นก๊าซเรือนกระจกที่รุนแรง',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module2/m2_l1_p3_pic01.png',
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
                //Fixed footer
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module2l1p2()),
                    );
                  },
                  onForwardPressed: () {
                    showLesson1CompletionDialog(
                      context: context,
                      backToMain: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Module2Screen(),
                          ),
                        );
                      },
                      lesson2Continue: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Module2l2p1(),
                          ),
                        );
                      },
                    );
                  },
                  currentPage: 3, // Current page index
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