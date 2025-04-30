import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'm3_lesson1_p6.dart';
import 'm3_lesson1_p8.dart';
import 'package:climatechange/learningpage/module3/m3_main.dart';

class Module3l1p7 extends StatelessWidget {
  const Module3l1p7({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    final int totalPages = PageConfig.lessonPageCounts['m3lesson1'] ?? 8;
    final pageheader = 'เรื่องที่ 4';
    final pagesubtitle = 'ขยะอิเล็กทรอนิกส์';

    final lessons = [
      {
        'title': '1. อุปกรณ์อิเล็กทรอนิกส์ขนาดใหญ่',
        'description': 'เช่น ตู้เย็น เครื่องซักผ้า เครื่องปรับอากาศ เตาอบไมโครเวฟ เครื่องโทรทัศน์',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_l1_p7/type_01.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      
      },
      {
        'title': '2. อุปกรณ์อิเล็กทรอนิกส์ขนาดเล็ก',
        'description': 'เช่น โทรศัพท์มือถือ คอมพิวเตอร์ แท็บเล็ต เครื่องคิดเลข เครื่องพิมพ์',
        'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
        'image': 'asset/module3/m3_l1_p7/type_02.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      
      },
      {
        'title': '3. อุปกรณ์โทรคมนาคม',
        'description': 'เช่น โทรศัพท์บ้าน โทรศัพท์มือถือ อุปกรณ์เครือข่าย',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_l1_p7/type_03.PNG',
        'bin': 'ถังขยะ',
      },
      {
        'title': '4. เครื่องมือแพทย์',
        'description': 'เช่น เครื่องเอกซเรย์ เครื่องวัดชีพจร อุปกรณ์ผ่าตัด',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_l1_p7/type_04.PNG',
        'bin': 'ถังขยะสีแดงมีสัญลักษณ์ขยะอันตราย',
      
      },
      {
        'title': '5. อุปกรณ์อิเล็กทรอนิกส์อื่นๆ',
        'description': 'เช่น ถ่านไฟฉาย แบตเตอรี่ หลอดไฟ แผงวงจร',
        'recycle': 'นำไปทิ้งในสถานที่กำจัดขยะอันตราย',
        'image': 'asset/module3/m3_l1_p7/type_05.PNG',
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