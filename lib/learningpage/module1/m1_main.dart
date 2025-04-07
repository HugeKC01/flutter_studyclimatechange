import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'lesson1/m1_lesson1_p1.dart';
import 'lesson2/m1_lesson2_p1.dart';

class Module1Screen extends StatelessWidget {
  const Module1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': 'บทเรียนที่ 1',
        'subtitle': 'ทำความรู้จักการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover' : 'asset/module1/module0101.png',
        'screen': Module1l1p1(),
      },
      {
        'title': 'บทเรียนที่ 2',
        'subtitle': 'ความสำคัญของการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover' : 'asset/module1/module0102.png',
        'screen': Module1l2p1(),
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        'Module 2',
        context,
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
                            color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(lesson['cover'] as String),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              '',
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