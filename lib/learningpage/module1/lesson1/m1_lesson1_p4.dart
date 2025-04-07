import 'package:flutter/material.dart';
import 'm1_lesson1_p3.dart';
import 'package:climatechange/learningpage/module1/lesson2/m1_lesson2_p1.dart';
import 'package:climatechange/learningpage/module1/m1_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module1l1p4 extends StatelessWidget {
  const Module1l1p4({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 ทำความรู้จักการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.3) ผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ';
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
                                ' ⦿ อากาศร้อนขึ้น อุณหภูมิโลกสูงขึ้น ทำให้เกิดคลื่นความร้อน ไฟป่า และภัยแล้ง     ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [component.HoverableImage(
                                  imagePath: 'asset/module1/dry.jpg',
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
                                  imagePath: 'asset/module1/polarb.jpg',
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
                                  imagePath: 'asset/module1/strom.jpg',
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
                                  imagePath: 'asset/module1/ext.jpg',
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
                                  builder: (context) => const Module1l1p3()),
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
                    'Page 4 of 4',
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
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                title: const Text('Complete'),
                                content: const Text(
                                  'คุณต้องการไปยังเรื่องที่ 2 หรือไม่?',),
                                actions: [
                                  TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                  child: const Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                        const Module1Screen()),
                                    ); // Close the dialog
                                  },
                                  child: const Text('กลับหน้าหลัก'),
                                  ),
                                  TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                        const Module1l2p1()),
                                    );
                                  },
                                  child: const Text('ไปยังเรื่องที่ 2'),
                                  ),
                                ],
                                );
                              },
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
      )
    );
  }
}