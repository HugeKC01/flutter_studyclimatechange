import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/learningpage/module1/m1_main.dart';
import 'm1_lesson2_p4.dart';
import 'm1_lesson2_p2.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'm1_lesson2_minigame.dart';

class Module1l2p3 extends StatelessWidget {
  const Module1l2p3({super.key});

  @override
  Widget build(BuildContext context) {
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1.1) เกมช่วยสมชายจัดกระเป๋า';
    final background = 'asset/overall/background1.png';
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
                            ); // Exit the current page
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
                                  const SizedBox(height: 20),
                        Module1l2MiniGame(), // Insert the minigame here
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
                          builder: (context) => const Module1l2p2()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module1l2p4()),
                    );
                  },
                  currentPage: 4, // Current page index
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
