import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'm3_lesson1_p6.dart';
import 'm3_lesson1_p8.dart';

class Module3l1p7 extends StatelessWidget {
  const Module3l1p7({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 1;

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
            FooterNavigation(
              onBackPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Module3l1p6()),
                );
              },
              onForwardPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Module3l1p8()),
                );
              },
              currentPage: 7, // Current page index
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