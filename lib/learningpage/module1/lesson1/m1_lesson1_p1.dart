import 'package:flutter/material.dart';
import '../m1_main.dart';
import 'm1_lesson1_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module1l1p1 extends StatelessWidget {
  const Module1l1p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 ทำความรู้จักการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.1) ความหมายของสภาพอากาศและภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;

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
                              style: const TextStyle(fontSize: fontsize),
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
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '         สภาพอากาศและภูมิอากาศเป็นคำที่มักถูกใช้สลับกัน แต่จริง ๆ แล้วมีความหมายที่แตกต่างกัน',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: fontsize),
                                  ),
                                  const SizedBox(height: 8),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '         สภาพอากาศ (weather)',
                                          style: TextStyle(
                                              fontSize: fontsize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: ' หมายถึง สภาพอากาศที่เกิดขึ้นในช่วงเวลาสั้น ๆ เช่น ชั่วโมง วัน หรือสัปดาห์ โดยจะมีการเปลี่ยนแปลงอยู่ตลอดเวลา เช่น อาจมีฝนตกในช่วงเช้า แต่แดดออกในช่วงบ่าย' ),                                   
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: fontsize),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module1/weather.png',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Text.rich(
                                    TextSpan(children:[
                                      const TextSpan(
                                        text: '         ภูมิอากาศ (climate)',
                                        style: TextStyle(
                                            fontSize: fontsize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(text: ' หมายถึง สภาพอากาศที่เกิดขึ้นในสถานที่หนึ่งๆบนโลก เป็นช่วงเวลาที่ยาวนาน เช่น เดือน ปี หรือหลายปี โดยจะมีการเปลี่ยนแปลงอยู่ตลอดเวลาเช่นกัน แต่จะมีการเปลี่ยนแปลงที่ช้ากว่าและมีแนวโน้มที่ชัดเจนกว่า เช่น อาจมีอุณหภูมิสูงขึ้นในช่วงฤดูร้อน และมีอุณหภูมิต่ำลงในช่วงฤดูหนาว' ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: fontsize),
                                  ),
                                  const SizedBox(height: 8),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module1/climate.jpeg',
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
                      // Page number
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius: BorderRadius.circular(50), // Pill shape
                        ),
                        child: const Text(
                        'Page 1 of 4',
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
                                      builder: (context) => const Module1l1p2()),
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
      )
    );
  }
}
