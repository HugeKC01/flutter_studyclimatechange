import 'package:flutter/material.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'm2_lesson1_p2.dart'; // Import m3_learn2_p2.dart file where the next screen is defined.
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module2l1p1 extends StatelessWidget {
  const Module2l1p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 สาเหตุของการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.1) สาเหตุของการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
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
                        color: Colors.white, // Background color for the button
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black, // Shadow color
                          blurRadius: 4, // Blur radius for the shadow
                          offset: const Offset(0, 2), // Shadow offset
                          ),
                        ],
                        ),
                        child: IconButton(
                        icon: const Icon(Icons.exit_to_app, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                    builder: (context) => const Module2Screen()
                              ),
                            );  // Exit the current page
                        },
                        ),
                      ),
                      const SizedBox(width: 20), // Add spacing between the icon and the header
                      Expanded( // Ensures the text wraps into a new line
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
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                                    '\n1. สาเหตุจากการใช้ชีวิตประจำวัน',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '\n - การใช้รถยนต์และมอเตอร์ไซค์ที่ปล่อยก๊าซคาร์บอนไดออกไซด์สู่ชั้นบรรยากาศ'
                                    '\n - การใช้ไฟฟ้าจากแหล่งพลังงานที่เผาไหม้เชื้อเพลิงฟอสซิล เช่น โรงไฟฟ้าถ่านหิน'
                                    '\n - การใช้พลาสติกมากเกินไป ซึ่งทำให้เกิดขยะจำนวนมากและก่อให้เกิดมลพิษ'
                                    '\n - การตัดไม้ทำลายป่าเพื่อขยายพื้นที่อยู่อาศัยและทำถนน',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                        imagePath: 'asset/module2/m2_l1_p1_pic01.png',
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module2/m2_l1_p1_pic02.png',
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module2/m2_l1_p1_pic03.png',
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
                //Fixed footer
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module2Screen()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module2l1p2()),
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