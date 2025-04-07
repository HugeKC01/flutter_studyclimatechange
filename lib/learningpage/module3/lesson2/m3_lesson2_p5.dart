import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson2_p4.dart';
import 'm3_lesson2_p6.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module3l2p5 extends StatelessWidget {
  const Module3l2p5({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.3) การปรับตัวของธรรมชาติและสิ่งมีชีวิต';
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
                                Text(
                                  '2. พืชก็ปรับตัวได้นะ',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),

                                Text(
                                  '         ในโลกนี้มีพื้นที่หลากหลายแบบ ทั้งที่ร้อนจัด หนาวเย็น ฝนตกเยอะ หรือแห้งแล้งมาก ๆ พืชแต่ละชนิดก็จะมีวิธีพิเศษในการเอาตัวรอด มาดูกันว่า พืชแต่ละชนิดมีวิธีการปรับตัวอย่างไร',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 8),

                                Text(
                                  '\n⦿    กระบองเพชร มีใบเป็นหนาม ช่วยลดการระเหยของน้ำ และลำต้นสามารถเก็บน้ำไว้ใช้ในช่วงแล้ง',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 8),

                                Text(
                                  '\n⦿    ต้นไม้บางชนิด ผลิใบในฤดูฝนและทิ้งใบในฤดูแล้ง เพื่อประหยัดน้ำ',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 8),

                                Text(
                                  '\n⦿    เมื่อสภาพแวดล้อมเปลี่ยน ทำให้ต้นไม้บางชนิด ต้องปรับตัว บางต้นออกดอกเร็วขึ้น เพื่อให้มีโอกาสสร้างเมล็ดก่อนที่อากาศจะร้อนหรือแห้งเกินไป บางต้นออกดอกช้าลง เพราะรอให้อากาศเหมาะสมจึงจะเริ่มเจริญเติบโต',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                
                                const SizedBox(height: 12),
                                Center(
                                  child: component.HoverableImage(
                                    imagePath: 'asset/module3/s1_m5.png',
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
                                    builder: (context) => const Module3l2p4()),
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
                      'Page 5 of 7',
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
                                    builder: (context) => const Module3l2p6()),
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