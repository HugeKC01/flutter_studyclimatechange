import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson2_p1.dart';
import 'm3_lesson2_p3.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module3l2p2 extends StatelessWidget {
  const Module3l2p2({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) วิธีปรับตัวและใช้ชีวิตต่ออุณหภูมิที่เปลี่ยนแปลง';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson2'] ?? 1;

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
                                    builder: (context) => const Module3Screen()
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
                                    '2. วิธีปรับตัวและใช้ชีวิตเมื่ออากาศหนาวขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '         เวลาที่อากาศเย็นลงหรือมีฤดูหนาว เราต้องรู้จักวิธีดูแลตัวเองให้ร่างกายอบอุ่นและปลอดภัย มาดูกันว่าเราจะทำอย่างไรได้บ้าง'
                                    'อากาศหนาวทำให้ร่างกายเย็นลง เราจึงต้องใส่เสื้อแขนยาว เสื้อกันหนาว ถุงมือ และหมวก เพื่อให้ร่างกายอบอุ่นอยู่เสมอ ถ้าอากาศหนาวจัด ควรอยู่ในบ้านหรือในที่ที่มีผ้าห่มและเครื่องทำความร้อน อาหารร้อนๆ เช่น ซุปร้อน ข้าวต้ม หรือชาร้อน จะช่วยให้ร่างกายอบอุ่นและมีพลังงานมากขึ้น',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/s1_m2.png',
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
                          builder: (context) => const Module3l2p1()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l2p3()),
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