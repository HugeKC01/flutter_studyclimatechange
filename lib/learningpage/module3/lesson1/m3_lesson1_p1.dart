import 'package:flutter/material.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'm3_lesson1_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module3l1p1 extends StatelessWidget {
  const Module3l1p1 ({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = 'วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพทางภูมิอากาศและการปรับตัวของมนุษย์และธรรมชาติ';
    final background = 'asset/overall/background1.png';

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
                                    '         วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศการเปลี่ยนแปลงสภาพภูมิอากาศเกิดจากการกระทำของมนุษย์ที่ส่งผลกระทบต่อธรรมชาติ เช่น การใช้พลังงานที่ก่อให้เกิดก๊าซเรือนกระจก การตัดไม้ทำลายป่า และการใช้ทรัพยากรธรรมชาติอย่างไม่ระมัดระวัง โดยการกระทำเหล่านี้ส่งผลให้อุณหภูมิพื้นผิวโลกสูงขึ้น ที่เรียกว่า ภาวะโลกร้อนซึ่งมีความเสี่ยงมากขึ้นที่จะเกิดสภาพอากาศรุนแรง เช่น คลื่นความร้อน ความแห้งแล้ง และ น้ำท่วม โดยในปัจจุบันความแห้งแล้งทั่วโลกได้เพิ่มสูงขึ้นมากกว่าใน 30 ปีที่ผ่านมาถึง 2 เท่า จนกลายเป็นวิกฤติโลกร้อน ที่กำลังส่งผลกระทบต่อระบบนิเวศ และการอยู่รอดของสิ่งมีชีวิตทุกๆ ชีวิตบนโลก ไม่เว้นแม้แต่ตัวมนุษย์เอง เราสามารถช่วยลดผลกระทบนี้ด้วยวิธีต่อไปนี้',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/s1m8.jpg',
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(50), // Pill shape
                  ),
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 0, 122, 255),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              heroTag: 'btnBack',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Module3Screen()),
                                );
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: const CircleBorder(),
                              child: const Icon(Icons.arrow_back,
                                  size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ),
                      // Page number
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius: BorderRadius.circular(50), // Pill shape
                        ),
                        child: const Text(
                        'Page 1 of 8',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      // Forward button
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 0, 122, 255),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              heroTag: 'btnForward',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Module3l1p2()),
                                );
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: const CircleBorder(),
                              child: const Icon(Icons.arrow_forward,
                                  size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}