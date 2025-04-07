import 'package:flutter/material.dart';
import 'm2_lesson2_p7.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm2_lesson2_p5.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module2l2p6 extends StatelessWidget {
  const Module2l2p6({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.2) อธิบายสภาพอากาศผิดฤดู';
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
                                    '3.) พายุและภัยธรรมชาติเกิดขึ้นบ่อยและรุนแรงมากขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เมื่อโลกของเราร้อนขึ้น พายุและภัยธรรมชาติก็เหมือนเพื่อนที่ไม่ดี ที่ชอบมาหาเราบ่อยขึ้น แถมยังมาแต่ละครั้งก็รุนแรงกว่าเดิม! พายุอาจจะพัดแรงจนหลังคาบ้านปลิว น้ำอาจจะท่วมสูงจนเดินทางไม่ได้ แผ่นดินอาจจะสั่นไหวรุนแรงกว่าเดิม หรือไฟป่าอาจจะลุกลามเร็วมากจนน่ากลัว เหมือนเวลาที่เราเล่นตึกต่อไม้ แล้วมีคนมาเขย่าแรง ๆ ตึกก็จะพังง่ายขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'อากาศที่ร้อนขึ้นเป็นเหมือนตัวกระตุ้น ที่ทำให้พายุและภัยธรรมชาติเหล่านี้เกิดขึ้นบ่อยขึ้น เหมือนเวลาที่เราเติมลมลูกโป่งมากเกินไป มันก็พร้อมที่จะแตกได้ง่ายขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และดูแลโลกของเราให้ดี เพื่อลดความเสี่ยงที่จะเกิดพายุและภัยธรรมชาติที่รุนแรงเหล่านี้กันนะ!',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 18),
                                  ),

                                  const SizedBox(height: 24),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath:
                                          'asset/module2/module2_learn2_pic6.png',
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
                                    builder: (context) => const Module2l2p5(),
                                  ),
                                );
                              },
                              backgroundColor: const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
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
                        'Page 6 of 9',
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
                                    builder: (context) => Module2l2p7(),
                                  ),
                                );
                              },
                              backgroundColor: const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
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