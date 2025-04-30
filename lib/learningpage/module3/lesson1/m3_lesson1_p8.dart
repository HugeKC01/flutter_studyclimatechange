import 'package:flutter/material.dart';
import '../m3_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson1_p7.dart';
import 'package:climatechange/learningpage/module3/lesson2/m3_lesson2_p1.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'package:climatechange/component/dialog.dart';


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
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 8;
    final pageheader = 'เรื่องที่ 5';
    final pagesubtitle = 'ขยะติดเชื้อ';

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
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface, // Updated color
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.white, // Background color for the button
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.shadow, // Updated color
                            blurRadius: 4,
                            offset: const Offset(0, 2),
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
                                  Image.asset(
                                    'asset/module3/m3_l1_p8.png',
                                    fit: BoxFit.contain, // Adjusted to prevent cropping
                                    width: double.infinity,
                                    height: 200,
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
            FooterNavigation(
              onBackPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Module3l1p7()),
                );
              },
              onForwardPressed: () {
                showLesson1CompletionDialog(
                  context: context,
                  backToMain: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module3Screen(),
                      ),
                    );
                  },
                  lesson2Continue: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module3l2p1(),
                      ),
                    );
                  },
                );
              },
              currentPage: 8, // Current page index
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