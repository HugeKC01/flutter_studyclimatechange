import 'package:flutter/material.dart';
import 'm1_lesson1_p3.dart';
import 'package:climatechange/learningpage/module1/lesson2/m1_lesson2_p1.dart';
import 'package:climatechange/learningpage/module1/m1_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/dialog.dart';
import 'package:climatechange/component/page_config.dart';

class Module1l1p4 extends StatelessWidget {
  const Module1l1p4({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 ทำความรู้จักการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.3) ผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m1lesson1'] ?? 1;

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
                                  builder: (context) => const Module1Screen()
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
                              const Text(
                                ' ⦿ อากาศร้อนขึ้น อุณหภูมิโลกสูงขึ้น ทำให้เกิดคลื่นความร้อน ไฟป่า และภัยแล้ง     ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [component.HoverableImage(
                                  imagePath: 'asset/module1/dry.png',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                ' ⦿ น้ำแข็งขั้วโลกละลาย ทำให้ระดับน้ำทะเลสูงขึ้น',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [component.HoverableImage(
                                  imagePath: 'asset/module1/polarbear.png',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                ' ⦿ เกิดพายุรุนแรงมากขึ้น เช่น พายุเฮอริเคน ไต้ฝุ่น',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [component.HoverableImage(
                                  imagePath: 'asset/module1/storm.png',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                ' ⦿ เกิดการเปลี่ยนแปลงของระบบนิเวศ เช่น การสูญพันธุ์ของสัตว์และพืช',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 12),
                              
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [component.HoverableImage(
                                  imagePath: 'asset/module1/extinc.png',
                                  ),
                                ],
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
                          builder: (context) => const Module1l1p3()),
                    );
                  },
                  onForwardPressed: () {
                    showLesson1CompletionDialog(
                      context: context,
                      backToMain: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Module1Screen(),
                          ),
                        );
                      },
                      lesson2Continue: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Module1l2p1(),
                          ),
                        );
                      },
                    );
                  },
                  currentPage: 4, // Current page index
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