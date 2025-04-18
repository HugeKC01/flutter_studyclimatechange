import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'm3_lesson1_p5.dart';
import 'm3_lesson1_p7.dart';

class Module3l1p6 extends StatelessWidget {
  const Module3l1p6({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 1;

    final lessons = [
      {
        'title': '1. พลาสติกประเภทที่ 1 สัญลักษณ์ 1 และ PET',
        'description': 'มีความใส เหนียว ทนทาน และป้องกันการแพร่ผ่านของก๊าซได้ดี เช่น แก้วใส ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_01_pic/plastic01.jpg',
      },
      {
        'title': '2. พลาสติกประเภทที่ 2 สัญลักษณ์ 2 และ HDPE',
        'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดนม ขวดน้ำมันพืช ถุงพลาสติก',
        'recycle': 'นำไปรีไซเคิลเป็นเฟอร์นิเจอร์ ศาลา ม้านั่ง',
        'image': 'asset/module3/m3_01_pic/plastic02.jpg',
      },
      {
        'title': '3. พลาสติกประเภทที่ 3 สัญลักษณ์ 3 และ PVC',
        'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'นำไปรีไซเคิลเป็นท่อประปาทางการเกษตรและกรวยจราจร',
        'image': 'asset/module3/m3_01_pic/plastic03.jpg',
      },
      {
        'title': '4. พลาสติกประเภทที่ 4 สัญลักษณ์ 4 และ LDPE',
        'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'นำไปรีไซเคิลเป็นถุงใส่ขยะ',
        'image': 'asset/module3/m3_01_pic/plastic04.jpg',
      },
      {
        'title': '5. พลาสติกประเภทที่ 5 สัญลักษณ์ 5 และ PP',
        'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'นำไปรีไซเคิลเป็นจานรองแก้ว กล่องแบตเตอรี่รถยนต์',
        'image': 'asset/module3/m3_01_pic/plastic05.jpg',
      },
      {
        'title': '6. พลาสติกประเภทที่ 6 สัญลักษณ์ 6 และ PS',
        'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'นำไปรีไซเคิลเป็นจานรองแก้ว และหากโฟมนำไปบดแล้วสามารถนำไปผสมกับเม็ดโฟมใหม่ แล้วนำไปผลิตเป็นโฟมซ้ำได้อีก',
        'image': 'asset/module3/m3_01_pic/plastic06.jpg',
      },
      {
        'title': '7. พลาสติกประเภทที่ 7 Other สัญลักษณ์ 7 และ O',
        'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
        'recycle': 'จะนำไปรีไซเคิลค่อนข้างยาก เพราะจะไม่ทราบว่าเป็นพลาสติกชนิดใดผสมอยู่',
        'image': 'asset/module3/m3_01_pic/plastic07.jpg',
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
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'ประเภทพลาสติก',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
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
                          builder: (context) => const Module3l1p5()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l1p7()),
                    );
                  },
                  currentPage: 6, // Current page index
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