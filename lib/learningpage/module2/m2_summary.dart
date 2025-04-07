import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm2_main.dart';
import 'package:climatechange/learningpage/module2/practice/practiceintro.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module2Sum extends StatelessWidget {
  const Module2Sum({super.key});

  @override
  Widget build(BuildContext context) {
    final pageheader = 'สรุป';
    final pagesubtitle = 'สาเหตุและผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';

    return Scaffold(
      appBar: buildAppBar(
        'Module 2 Summary',
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
                                    builder: (context) => const Module2Screen()
                              ),
                            );
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
                                    '         สาเหตุหลักมาจากการกระทำของมนุษย์ ทั้งชีวิตประจำวันและความต้องการพัฒนาที่ไม่ยั่งยืน กิจกรรมต่างๆ เช่น การเผาผลาญเชื้อเพลิงฟอสซิล การเกษตร (โดยเฉพาะปศุสัตว์) และการตัดไม้ทำลายป่า ปล่อยก๊าซเรือนกระจกปริมาณมาก ทำให้โลกร้อนขึ้น',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '         อุณหภูมิสูงขึ้นนำไปสู่คลื่นความร้อน ภัยแล้ง น้ำท่วม ระดับน้ำทะเลสูงขึ้น ระบบนิเวศทะเลเสียหาย พายุรุนแรงขึ้น กระทบสุขภาพ อาหาร น้ำ เศรษฐกิจ และสังคม การร่วมมือกันลดการปล่อยก๊าซเรือนกระจกจึงสำคัญ',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module1/Designer5.jpeg',
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
                                      builder: (context) => const Module2Screen()),
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
                        'Page 6 of 6',
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
                                    'คุณได้เรียนรู้เรื่องที่ 2 เสร็จสิ้นแล้ว\n'
                                    'คุณสามารถทำแบบทดสอบเพื่อประเมินความเข้าใจของคุณได้\n\n'
                                    'คุณต้องการทำแบบทดสอบหรือไม่?'),
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
                                          const Module2Screen()),
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
                                          const PracticeM2Introduction()),
                                      );
                                    },
                                    child: const Text('ไปทำแบบทดสอบ'),
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
        ],
      ),
    );
  }
}