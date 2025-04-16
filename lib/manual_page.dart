import 'package:flutter/material.dart';
import 'package:climatechange/component/adaptivenavigation.dart';

class ManualPage extends StatelessWidget {
  final List<String> imagePaths = [
    'asset/manual/home.png',
    'asset/manual/drawer.png',
    'asset/manual/profile.png',
    'asset/manual/modulePage.png',
    'asset/manual/moduleContent.png',
    'asset/manual/moduleComplete.png',
    'asset/manual/moduleTest.png',
    'asset/manual/postTest.png',
  ];

  final pages = [
    {
      'title' : 'หน้าหลัก',
      'description' : 'หน้าหลักของแอปพลิเคชัน',
      'cover' : 'asset/manual/home.png',
    },
    {
      'title' : 'เมนูด้านข้าง',
      'description' : 'เมนูด้านข้างที่ให้คุณเข้าถึงฟีเจอร์ต่างๆ',
      'cover' : 'asset/manual/drawer.png',
    },
    {
      'title' : 'ตัวฉัน',
      'description' : 'โปรไฟล์ของผู้ใช้ที่แสดงข้อมูลส่วนตัว',
      'cover' : 'asset/manual/profile.png',
    },
    {
      'title' : 'เริ่มเรียน',
      'description' : 'หน้าที่แสดงหน่วยการเรียนรู้ต่าง ๆ',
      'cover' : 'asset/manual/modulePage.png',
    },
    {
      'title' : 'เนื้อหา',
      'description' : 'เนื้อหาภายในหน่วยการเรียนรู้',
      'cover' : 'asset/manual/moduleContent.png',
    },
    {
      'title' : 'จบการเรียนรู้',
      'description' : 'หน้าที่แสดงว่าหน่วยการเรียนรู้เสร็จสมบูรณ์แล้ว',
      'cover' : 'asset/manual/moduleComplete.png',
    },
    {
      'title' : 'ทดสอบท้ายหน่วย',
      'description' : 'หน้าที่ให้ทำแบบทดสอบหลังเรียนจบโมดูล',
      'cover' : 'asset/manual/moduleTest.png',
    },
    {
      'title' : 'ทดสอบหลังเรียน',
      'description' : 'หน้าที่ให้ทำแบบทดสอบหลังเรียนจบเนื้อหาทั้งหมด',
      'cover' : 'asset/manual/postTest.png',
    }
  ];

  ManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height / 3;

    return AdaptiveNavigation(
      title: 'Manual',
      child: Scaffold(
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: SizedBox(
              height: cardHeight * 1.25, // Increased size by 25%
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      page['cover']!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the column content
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            page['title']!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            page['description']!,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    );
  }
}
