import 'package:climatechange/learningpage/module3/lesson1/wordgame-1.dart';
import 'package:flutter/material.dart';
import 'package:climatechange/main.dart';
import 'package:climatechange/component/appbar.dart';
import 'lesson1/m3_lesson1_p1.dart';
import 'lesson2/m3_lesson2_p1.dart';
import 'm3_summary.dart';
import 'practice/practiceintro.dart';
import 'package:climatechange/component/animatedbackground.dart';

class Module3Screen extends StatelessWidget {
  const Module3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': 'เรื่องที่ 1',
        'subtitle': 'วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover': 'asset/module3/module0301.png',
        'screen': Module3l1p1(),
      },
      {
        'title': 'เรื่องที่ 2',
        'subtitle': 'การปรับตัวและการใช้ชีวิต',
        'cover': 'asset/module3/module0302.png',
        'screen': Module3l2p1(),
      },
      {
        'title': 'สรุปการเรียนรู้',
        'subtitle': 'วิธีการแก้ปัญหาและการปรับตัวกับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover': 'asset/default/summary_.png',
        'screen': Module3Sum(),
      },
      {
        'title': 'แบบฝึกหัด',
        'subtitle': 'วิธีการแก้ปัญหาและการปรับตัวกับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover': 'asset/default/testimage_.png',
        'screen': PracticeM3Introduction(),
      },
      {
        'title': 'Minigame',
        'subtitle': 'matching game',
        'cover': 'asset/default/testimage_.png',
        'screen': WordMatchGamePage(),
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        'Module 3',
        context,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
              (route) => false, // Remove all previous routes
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3, // Adjust the opacity value as needed
              child: AnimatedBackground(),
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 700 ? 1 : 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1 / 1,
                    ),
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final lesson = lessons[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5.0,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => lesson['screen'] as Widget,
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    image: DecorationImage(
                                      image: AssetImage(lesson['cover'] as String),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ListTile(
                                title: Text(lesson['title'] as String),
                                subtitle: Text(lesson['subtitle'] as String),
                                trailing: const Icon(Icons.lock_open), // Change to lock/unlock dynamically if needed
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => lesson['screen'] as Widget,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}