import 'package:flutter/material.dart';
import '../m3_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson1_p1.dart';
import 'm3_lesson1_p3.dart';

class Module3l1p8 extends StatelessWidget {
  const Module3l1p8({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ หน้า 8';
    final background = 'asset/module1/background1.png';

    final lessons = [
      
    ];

    return Scaffold(
      appBar: buildAppBar(
        pagetitle,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ขยะติดเชื้อ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'การเปลี่ยนแปลงสภาพภูมิอากาศเป็นปัญหาที่สำคัญในปัจจุบัน ซึ่งส่งผลกระทบต่อสิ่งแวดล้อมและชีวิตของมนุษย์ทั่วโลก การแก้ปัญหานี้ต้องอาศัยความร่วมมือจากทุกภาคส่วน เช่น การลดการปล่อยก๊าซเรือนกระจก การใช้พลังงานหมุนเวียน และการปลูกป่าเพื่อดูดซับคาร์บอนไดออกไซด์',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'หัวข้อย่อย: การลดการปล่อยก๊าซเรือนกระจก',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'การลดการปล่อยก๊าซเรือนกระจกสามารถทำได้โดยการเปลี่ยนมาใช้พลังงานสะอาด เช่น พลังงานแสงอาทิตย์และพลังงานลม รวมถึงการปรับปรุงกระบวนการผลิตในอุตสาหกรรมให้มีประสิทธิภาพมากขึ้น',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'หัวข้อย่อย: การปลูกป่า',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'การปลูกป่าเป็นวิธีที่มีประสิทธิภาพในการดูดซับคาร์บอนไดออกไซด์จากชั้นบรรยากาศ นอกจากนี้ยังช่วยฟื้นฟูระบบนิเวศและเพิ่มความหลากหลายทางชีวภาพ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Back and Forward buttons
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
                                  builder: (context) => const Module3l1p1()),
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
                                  builder: (context) => const Module3l1p3()),
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
    );
  }
}