import 'package:flutter/material.dart';
import 'm1_lesson1_p1.dart';
import 'm1_lesson1_p3.dart';
import 'package:climatechange/learningpage/module1/m1_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module1l1p2 extends StatefulWidget {
  const Module1l1p2({super.key});

  @override
  State<Module1l1p2> createState() => _Module1l1p2State();
}

class _Module1l1p2State extends State<Module1l1p2> {
  double _opacity = 0.5; // Initial opacity value

  // Function to determine slider color based on value
  Color _getSliderColor(double value) {
    if (value < 0.33) {
      return Colors.blue; // Low value
    } else if (value < 0.66) {
      return Colors.orange; // Medium value
    } else {
      return Colors.red; // High value
    }
  }

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 ทำความรู้จักการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.2) การเปลี่ยนแปลงสภาพภูมิอากาศ';
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
                                  builder: (context) => const Module1Screen()),
                            ); // Exit the current page
                          },
                        ),
                      ),
                      const SizedBox(width: 20), // Add spacing between the icon and the header
                      Expanded(
                        // Ensures the text wraps into a new line
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
                                  const Text(
                                    '          ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text:
                                              '         การเปลี่ยนแปลงสภาพภูมิอากาศ (climate change)',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const TextSpan(
                                            text:
                                                ' หมายถึง การเปลี่ยนแปลงที่เกิดขึ้นในสภาพภูมิอากาศของโลก ซึ่งอาจเกิดจากการกระทำของมนุษย์หรือจากธรรมชาติ โดยการเปลี่ยนแปลงนี้สามารถส่งผลกระทบต่อสิ่งมีชีวิตและสิ่งแวดล้อมได้ เช่น อุณหภูมิโลกที่สูงขึ้น น้ำแข็งขั้วโลกละลาย หรือฤดูกาลที่เปลี่ยนไป ซึ่งเกิดขึ้นจากปัจจัยต่าง ๆ'),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 50),
                                  // Vertical slider with fade-in/out images
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Opacity(
                                                opacity: 1,
                                                child: component.HoverableImage(
                                                  imagePath:
                                                      'asset/module1/global_climate.png',
                                                ),
                                              ),
                                              // First image
                                              Opacity(
                                                opacity: 1 - _opacity,
                                                child: component.HoverableImage(
                                                  imagePath:
                                                      'asset/module1/global_climate_clean.png',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Vertical slider
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: SizedBox(
                                          height: 100, // Match the height of the image
                                          width: 500,
                                          child: SliderTheme(
                                            data: SliderTheme.of(context).copyWith(
                                              activeTrackColor:
                                                  _getSliderColor(_opacity), // Dynamic color
                                              thumbColor: _getSliderColor(_opacity), // Dynamic thumb color
                                              trackHeight: 8.0, // Adjust the thickness of the slider track
                                            ),
                                            child: Slider(
                                              value: _opacity,
                                              min: 0.0,
                                              max: 1.0,
                                              onChanged: (value) {
                                                setState(() {
                                                  _opacity = value; // Update opacity
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module1l1p1()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module1l1p3()),
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


