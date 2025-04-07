import 'package:flutter/material.dart';
import '../m3_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson1_p1.dart';
import 'm3_lesson1_p7.dart';

class Module3l1p3 extends StatelessWidget {
  const Module3l1p3({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/module1/background1.png';

    final lessons = [
      {
        'title': '1. อุปกรณ์อิเล็กทรอนิกส์ขนาดใหญ่',
        'description': 'เช่น ตู้เย็น เครื่องซักผ้า เครื่องปรับอากาศ เตาอบไมโครเวฟ เครื่องโทรทัศน์',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_01_p7/image01.jpg',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      
      },
      {
        'title': '2. อุปกรณ์อิเล็กทรอนิกส์ขนาดเล็ก',
        'description': 'เช่น โทรศัพท์มือถือ คอมพิวเตอร์ แท็บเล็ต เครื่องคิดเลข เครื่องพิมพ์',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_01_p7/image02.jpg',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      
      },
      {
        'title': '3. อุปกรณ์โทรคมนาคม',
        'description': 'เช่น โทรศัพท์บ้าน โทรศัพท์มือถือ อุปกรณ์เครือข่าย',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_01_p7/image03.jpg',
        'bin': 'ถังขยะ',
      },
      {
        'title': '4. เครื่องมือแพทย์',
        'description': 'เช่น เครื่องเอกซเรย์ เครื่องวัดชีพจร อุปกรณ์ผ่าตัด',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_01_p7/image04.jpg',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      
      },
      {
        'title': '5. อุปกรณ์อิเล็กทรอนิกส์อื่นๆ',
        'description': 'เช่น ถ่านไฟฉาย แบตเตอรี่ หลอดไฟ แผงวงจร',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_01_p7/image05.jpg',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      },
      
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
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  final lesson = lessons[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(lesson['image']!),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lesson['title']!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(lesson['description']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('การรีไซเคิล : ${lesson['recycle']}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ถังขยะ : ${lesson['recycle']}'),
                        ),
                      ],
                    ),
                  );
                },
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