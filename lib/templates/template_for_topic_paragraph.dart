import 'package:flutter/material.dart';
import '../learningpage/module3/m3_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import '../learningpage/module3/lesson1/m3_lesson1_p1.dart';
import '../learningpage/module3/lesson1/m3_lesson1_p7.dart';

import 'package:climatechange/style/style.dart' as style;

class Module3l1p8 extends StatefulWidget {
  const Module3l1p8({super.key});

  @override
  State<Module3l1p8> createState() => _Module3l1p8State();
}

class _Module3l1p8State extends State<Module3l1p8> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ หน้า 8';
    final background = 'asset/module1/background1.png';

    final lessons = [
      {
        'header': 'ขยะติดเชื้อ',
        'description': 'ขยะติดเชื้อเป็นขยะที่เกิดจากผู้ป่วย เช่น หน้ากากอนามัย พลาสเตอร์ปิดแผล ผ้าพันแผล',
        'image': 'asset/default/Module01.png',
      },
      {
        'header': '',
        'description': 'หากกำจัดขยะติดเชื้อไม่ถูกวิธี',
        'image': 'asset/default/Module01.png',
      },
      {
        'header': '',
        'description': 'จะทำให้เสี่ยงแพร่เชื้อโรค และทำให้การกำจัดขยะในภายหลังยากขึ้น',
        'image': 'asset/default/Module01.png',
      },
      {
        'header': '',
        'description': 'การจัดการขยะติดเชื้ออย่างเหมาะสมจึงเป็น',
        'image': 'asset/default/Module01.png',
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        pagetitle,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Flexible(
                          child: Card(
                            margin: const EdgeInsets.all(16.0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lessons[0]['header']!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: style.normalSizedBoxHeight),
                                  Text(
                                    lessons[0]['description']!,
                                    style: TextStyle(
                                      fontSize: style.fontSizeBody,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: style.normalSizedBoxHeight),
                                  Text(
                                    lessons[1]['description']!,
                                    style: TextStyle(
                                      fontSize: style.fontSizeBody,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: style.normalSizedBoxHeight),
                                  Text(
                                    lessons[2]['description']!,
                                    style: TextStyle(
                                      fontSize: style.fontSizeBody,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: style.bigSizedBoxHeight),
                                  // Using Text.rich to create a text with mixed styles
                                  Text.rich(
                                  TextSpan(
                                    text: lessons[3]['description']!, // Regular text
                                    style: TextStyle(
                                      fontSize: style.fontSizeBody,
                                      color: Colors.black87,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'สิ่งสำคัญ', // Bold text
                                        style: TextStyle(fontSize: style.fontSizeHeader, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                      ),
                                    ],
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
              ),
            ),
            // Back and Forward buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                  builder: (context) => const Module3l1p1()),
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
                                  builder: (context) => const Module3l1p3()),
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
    );
  }
}