import 'package:flutter/material.dart';
import '../m3_main.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'm3_lesson1_p1.dart';
import 'm3_lesson1_p3.dart';

class Module3l1p2 extends StatelessWidget {
  const Module3l1p2({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 3 วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 3';
    final pagesubtitle = '3.1) วิธีการทิ้งขยะที่เจอในชีวิตประจำวันให้ถูกต้อง';
    final background = 'asset/module1/background1.png';

    final lessons = [
    {
      'title': '1. พลาสติกประเภทที่ 1 Polyethylene Terephthalate สัญลักษณ์ 1 และ PET',
      'description': 'มีความใส เหนียว ทนทาน และป้องกันการแพร่ผ่านของก๊าซได้ดี เช่น แก้วใส ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
      'recycle': 'นำไปรีไซเคิลเป็นเส้นใยโพลิเอสเตอร์ ทำเสื้อกันหนาว พรม',
      'image': 'asset/module3/M3_01_pic/plastic01.jpg',
    },
    {
      'title': '2. พลาสติกประเภทที่ 2 High-Density Polyethylene สัญลักษณ์ 2 และ HDPE',
      'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดนม ขวดน้ำมันพืช ถุงพลาสติก',
      'recycle': 'นำไปรีไซเคิลเป็นท่อประปา ถังขยะ',
      'image': 'asset/module3/M3_01_pic/plastic02.jpg',
    },
    {
      'title': '3. พลาสติกประเภทที่ 3 Polyvinyl Chloride สัญลักษณ์ 3 และ PVC',
      'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
      'recycle': 'นำไปรีไซเคิลเป็นท่อประปา ถังขยะ',
      'image': 'asset/module3/M3_01_pic/plastic03.jpg',
    },
    {
      'title': '4. พลาสติกประเภทที่ 4 Low-Density Polyethylene สัญลักษณ์ 4 และ LDPE',
      'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
      'recycle': 'นำไปรีไซเคิลเป็นท่อประปา ถังขยะ',
      'image': 'asset/module3/M3_01_pic/plastic04.jpg',
    },
    {
      'title': '5. พลาสติกประเภทที่ 5 Polypropylene สัญลักษณ์ 5 และ PP',
      'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
      'recycle': 'นำไปรีไซเคิลเป็นท่อประปา ถังขยะ',
      'image': 'asset/module3/M3_01_pic/plastic05.jpg',
    },
    {
      'title': '6. พลาสติกประเภทที่ 6 Polystyrene สัญลักษณ์ 6 และ PS',
      'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
      'recycle': 'นำไปรีไซเคิลเป็นท่อประปา ถังขยะ',
      'image': 'asset/module3/M3_01_pic/plastic06.jpg',
    },
    {
      'title': '7. พลาสติกประเภทที่ 7 Other สัญลักษณ์ 7 และ O',
      'description': 'มีความเหนียว ทนทานต่อการกระแทกและการดัดงอ เช่น ขวดน้ำอัดลม ขวดน้ำดื่มและขวดน้ำมันพืช',
      'recycle': 'นำไปรีไซเคิลเป็นท่อประปา ถังขยะ',
      'image': 'asset/module3/M3_01_pic/plastic07.jpg',
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
          
          child: ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.asset(lesson['image']!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        lesson['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              );
            },           
          ),
          
          
       ),    
      );
  }
}