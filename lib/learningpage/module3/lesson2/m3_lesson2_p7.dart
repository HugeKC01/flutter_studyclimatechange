import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import '../m3_main.dart';
import 'm3_lesson2_p6.dart';

class Module3l2p7 extends StatelessWidget {
  const Module3l2p7({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = 'สรุป';
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
                                const SizedBox(height: 8),
                                Text(
                                  '         การเปลี่ยนแปลงสภาพภูมิอากาศเป็นปัญหาที่ทุกคนต้องช่วยกันแก้ไข เราสามารถช่วยได้โดยการลดการใช้พลังงาน ทิ้งขยะให้ถูกต้อง และปรับตัวต่อสภาพอากาศที่เปลี่ยนแปลง เพื่อให้โลกของเราน่าอยู่ต่อไปในอนาคต',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                
                                const SizedBox(height: 12),
                                Center(
                                  child: HoverableImage(
                                    imagePath: 'asset/module3/s1_m7.png',
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
                                    builder: (context) => const Module3l2p6()),
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
                      'Page 7 of 7',
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
                                    builder: (context) => const Module3Screen()),
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
  final String imagePath; // เส้นทางของรูปภาพ

  const HoverableImage({super.key, required this.imagePath});

  @override
  HoverableImageState createState() => HoverableImageState();
}

class HoverableImageState extends State<HoverableImage> {
  bool _isHovered = false; // สถานะ hover หรือกดค้าง

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isHovered = true; // เมื่อกดค้าง
        });
      },
      onTapUp: (_) {
        setState(() {
          _isHovered = false; // เมื่อปล่อย
        });
      },
      onTapCancel: () {
        setState(() {
          _isHovered = false; // เมื่อยกเลิกการกด
        });
      },
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 200), // ระยะเวลาในการเปลี่ยนแปลง
        curve: Curves.easeInOut, // ลักษณะการเคลื่อนไหว
        alignment: _isHovered
            ? const Alignment(-0.1, 0.0) // ขยับไปทางซ้ายเล็กน้อยเมื่อ hover
            : Alignment.center, // ตำแหน่งปกติ
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // ระยะเวลาในการเปลี่ยนแปลง
          curve: Curves.easeInOut, // ลักษณะการเคลื่อนไหว
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // เส้นขอบสีขาว
              width: 4.0, // ความหนาของเส้นขอบ
            ),
            borderRadius: BorderRadius.circular(16.0), // กำหนดขอบมน
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.2 * 255).toInt()), // ใช้ withAlpha แทน withOpacity
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.1)) // ขยายขนาดเมื่อ hover
              : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // กำหนดขอบมนให้กับรูปภาพ
            child: Image.asset(
              widget.imagePath, // ใช้เส้นทางรูปภาพจากพารามิเตอร์
              width: MediaQuery.of(context).size.width * (_isHovered ? 0.4 : 0.4), // ขยายขนาดเมื่อ hover
              fit: BoxFit.contain, // ปรับขนาดรูปภาพให้พอดี
            ),
          ),
        ),
      ),
    );
  }
}