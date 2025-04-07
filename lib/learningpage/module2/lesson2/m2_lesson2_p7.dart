import 'package:flutter/material.dart';
import 'm2_lesson2_p8.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm2_lesson2_p6.dart';
import 'package:climatechange/learningpage/module2/m2_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module2l2p7 extends StatelessWidget {
  const Module2l2p7({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.3) อธิบายผลกระทบที่มีต่อสิ่งแวดล้อม';
    final background = 'asset/overall/background1.png';

    return Scaffold(
      appBar: buildAppBar(
        pagetitle,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Container(
        // Background decoration for the entire screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
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
                                  '1.) ระบบนิเวศเปลี่ยนแปลง ทำให้สัตว์และพืชบางชนิดสูญพันธุ์',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'เมื่อโลกของเราร้อนขึ้น บ้านของสัตว์และพืชก็เปลี่ยนไป! อากาศที่ร้อนขึ้น น้ำที่เปลี่ยนไป ทำให้บางที่เคยมีป่าไม้ ก็กลายเป็นทะเลทราย บางที่เคยหนาวเย็น ก็อุ่นขึ้น สัตว์และพืชบางชนิดปรับตัวไม่ทันกับบ้านใหม่ที่เปลี่ยนไป ทำให้พวกมันค่อย ๆ หายไปจากโลกนี้ เหมือนเวลาที่เราย้ายบ้าน แล้วไม่มีเพื่อน ไม่มีอาหารที่เราเคยกิน',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'การเปลี่ยนแปลงเหล่านี้ทำให้ระบบนิเวศเสียสมดุล เหมือนเวลาที่เราเล่นเกม แล้วตัวละครสำคัญหายไป เกมก็ไม่สนุกเหมือนเดิม สัตว์และพืชแต่ละชนิดมีความสำคัญต่อโลกของเรา ถ้าพวกมันหายไป ก็จะส่งผลกระทบต่อสิ่งมีชีวิตอื่น ๆ ด้วย',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'เด็ก ๆ ช่วยกันดูแลโลก ลดการใช้พลังงาน ปลูกต้นไม้ และไม่ทำลายธรรมชาติ เพื่อรักษาบ้านของสัตว์และพืช และช่วยให้พวกมันอยู่รอดต่อไปได้นะ!"',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 18),
                                ),

                                const SizedBox(height: 24),
                                Center(
                                  child: component.HoverableImage(
                                    imagePath:
                                        'asset/module2/module2_learn2_pic7.png',
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
                                  builder: (context) => const Module2l2p6(),
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
                      'Page 7 of 9',
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
                                  builder: (context) => Module2l2p8(),
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
      )
    );
  }
}