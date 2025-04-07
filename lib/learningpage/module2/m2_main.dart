import 'package:climatechange/learningpage/module2/m2_summary.dart';
import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'lesson1/m2_lesson1_p1.dart';
import 'lesson2/m2_lesson2_p1.dart';
import 'package:climatechange/main.dart';
import 'practice/practiceintro.dart';

class Module2Screen extends StatelessWidget {
  const Module2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': 'เรื่องที่ 1',
        'subtitle': 'สาเหตุของการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': Module2l1p1(),
      },
      {
        'title': 'เรื่องที่ 2',
        'subtitle': 'ผลกระทบจากการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': Module2l2p1(),
      },
      {
        'title': 'สรุปการเรียนรู้',
        'subtitle': 'สาเหตุและผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': Module2Sum(),
      },
      {
        'title': 'แบบฝึกหัด',
        'subtitle': 'สาเหตุและผลกระทบของการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': PracticeM2Introduction(),
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        'Module 2',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2, // Adjust columns based on screen width
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 3 / 2, // Adjust the aspect ratio of the cards
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
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Cover Section',
                              style: TextStyle(color: Colors.white),
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
    );
  }
}