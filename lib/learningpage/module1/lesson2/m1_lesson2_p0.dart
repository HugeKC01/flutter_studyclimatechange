import 'package:flutter/material.dart';
import '../m1_main.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm1_lesson2_p1.dart';
import 'm1_lesson2_quiz.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module1l2p0 extends StatefulWidget {
  const Module1l2p0({super.key});

  @override
  State<Module1l2p0> createState() => _Module1l2p0State();
}

class _Module1l2p0State extends State<Module1l2p0> {
  bool _showExplanation = true;

  @override
  Widget build(BuildContext context) {
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) ทำไมเราต้องสนใจเรื่องนี้?';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m1lesson2'] ?? 1;

    return Scaffold(
      appBar: buildAppBar(
        'เรื่องที่ 2 ความสำคัญของการเปลี่ยนแปลงสภาพภูมิอากาศ',
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
                // Header Section
                ArticleHeader(
                   header: pageheader,
                   subtitle: pagesubtitle,
                   fontSize: fontsize,
                   onExit: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const Module1Screen(),
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
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final double maxWidth = constraints.maxWidth > 700
                                  ? 700
                                  : constraints.maxWidth * 0.95;
                              return Center(
                                child: SizedBox(
                                  width: maxWidth,
                                  child: Card(
                                    color: const Color.fromARGB(225, 255, 255, 255),
                                    elevation: 6, // Increased elevation
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12), // More rounded corners
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (_showExplanation)
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'คำอธิบายก่อนทำแบบทดสอบ:',
                                                  style: TextStyle(
                                                    fontSize: 25, // Slightly larger font
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 12), // Extra spacing
                                                const Text(
                                                  'คุณกำลังจะทำแบบทดสอบสั้น ๆ 3 ข้อ '
                                                  'เพื่อทบทวนความรู้ก่อนเข้าสู่บทเรียนถัดไป',
                                                ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),                                                Center(
                                                  child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                    _showExplanation = false;
                                                    });
                                                  },
                                                  child: const Text('เริ่มทำแบบทดสอบ'),
                                                  ),
                                                ),
                                                
                                                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                                              ],
                                            )
                                          else
                                            Module1l2Quiz(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                          builder: (context) => const Module1Screen()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module1l2p1()),
                    );
                  },
                  currentPage: 1, // Current page index
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