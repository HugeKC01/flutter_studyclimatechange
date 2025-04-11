import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson2_p5.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/learningpage/module3/enhanced/enhancedintro.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'package:climatechange/component/dialog.dart';

class Module3l2p6 extends StatelessWidget {
  const Module3l2p6({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.3) การปรับตัวของธรรมชาติและสิ่งมีชีวิต';
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
                                    '3. มนุษย์ก็ปรับตัวเหมือนกัน',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '         ไม่ใช่แค่สัตว์หรือพืชเท่านั้นที่ต้องปรับตัว  มนุษย์อย่างพวกเราก็ต้องปรับตัว เมื่อโลกเปลี่ยนแปลง ไม่ว่าจะเป็นอากาศที่ร้อนขึ้น หนาวลง หรือฝนตกไม่ตรงฤดูถ้าเราไม่ปรับตัว อาจทำให้ใช้ชีวิตลำบากหรือเจ็บป่วยได้ มาดูกันเลยว่าเราจะปรับตัวได้อย่างไร',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    ใส่เสื้อผ้าให้เหมาะกับอากาศ เช่น เสื้อกันหนาวเวลาหนาว หรือเสื้อบางในหน้าร้อน',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    สร้างบ้านที่สามารถป้องกันฝน ลม และแดดได้ดี เช่น บ้านที่มีหลังคาใหญ่ๆ หรือบ้านที่มีการระบายอากาศได้ดี',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    ใช้เทคโนโลยี เช่น เครื่องปรับอากาศ หรือเครื่องทำความร้อน เพื่อให้สบายขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n⦿    ปรับกิจกรรมตามสภาพอากาศ ออกไปทำกิจกรรมตอนเช้าหรือเย็น เพื่อเลี่ยงอากาศร้อนจัด หรือพักผ่อนมากขึ้นเมื่ออากาศเย็น เพื่อรักษาพลังงาน',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),                              
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/s1_m6.png',
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
                          builder: (context) => const Module3l2p5()),
                    );
                  },
                  onForwardPressed: () {
                    showLesson2CompletionDialog(
                      context: context,
                      backToMain: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Module3Screen(),
                          ),
                        );
                      },
                      activity: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnhancedM3Introduction(),
                          ),
                        );
                      },
                    );
                  },
                  currentPage: 6, // Current page index
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