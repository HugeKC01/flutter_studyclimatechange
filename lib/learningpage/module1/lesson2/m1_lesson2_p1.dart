import 'package:flutter/material.dart';
import '../m1_main.dart'; // ตรวจสอบว่าไฟล์นี้มี MyApp หรือไม่
import 'm1_lesson2_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';

class Module1l2p1 extends StatelessWidget {
  const Module1l2p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) ทำไมเราต้องสนใจเรื่องนี้?';
    final background = 'asset/module1/background1.png';

    return Scaffold(
      appBar: buildAppBar(
        'เรื่องที่ 2 ความสำคัญของการเปลี่ยนแปลงสภาพภูมิอากาศ',
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
                              builder: (context) => const Module1Screen(),
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
                                const Text(
                                  '         การเปลี่ยนแปลงสภาพภูมิอากาศมีผลต่อชีวิตของมนุษย์และสิ่งแวดล้อม เช่น'
                                  ' อาหารที่เรากิน อากาศที่เราหายใจ และที่อยู่อาศัยของเรา หากเราไม่ช่วยกันลดผลกระทบ โลกอาจเผชิญกับปัญหามากขึ้นในอนาคต',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '\n1. กระทบต่อสุขภาพของเรา',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '         สภาพอากาศที่เปลี่ยนแปลงทำให้เกิดโรคที่เกี่ยวข้องกับความร้อนมากขึ้น เช่น โรคลมแดด และเพิ่มการระบาดของโรคที่มียุงเป็นพาหะอย่างไข้เลือดออกและมาลาเรีย',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: HoverableImage(
                                    imagePath: 'asset/module1/Designer.jpeg',
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
                                    builder: (context) => const Module1Screen()),
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
                                    builder: (context) => const Module1l2p2()),
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
      ),
    );
  }
}

class HoverableImage extends StatefulWidget {
  final String imagePath; // Path to the image

  const HoverableImage({super.key, required this.imagePath});

  @override
  HoverableImageState createState() => HoverableImageState();
}

class HoverableImageState extends State<HoverableImage> {
  bool _isHovered = false; // Hover state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isHovered = true; // On hover
        });
      },
      onTapUp: (_) {
        setState(() {
          _isHovered = false; // On release
        });
      },
      onTapCancel: () {
        setState(() {
          _isHovered = false; // On cancel
        });
      },
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 200), // Animation duration
        curve: Curves.easeInOut, // Animation curve
        alignment: _isHovered
            ? const Alignment(-0.1, 0.0) // Slight left shift on hover
            : Alignment.center, // Default position
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // Animation duration
          curve: Curves.easeInOut, // Animation curve
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // White border
              width: 4.0, // Border width
            ),
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.2 * 255).toInt()),
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.1)) // Scale up on hover
              : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners for image
            child: Image.asset(
              widget.imagePath,
              width: MediaQuery.of(context).size.width * (_isHovered ? 0.4 : 0.4),
              fit: BoxFit.contain, // Fit image within bounds
            ),
          ),
        ),
      ),
    );
  }
}
