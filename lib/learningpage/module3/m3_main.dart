import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'lesson1/m3_lesson1_p1.dart';
import 'lesson2/m3_lesson2_p1.dart';

class Module3Screen extends StatelessWidget {
  const Module3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': 'บทเรียนที่ 1',
        'subtitle': 'วิธีการแก้ปัญหาการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'screen': m3_lesson1_p1(),
      },
      {
        'title': 'บทเรียนที่ 2',
        'subtitle': 'Adapting and saving our world\nการปรับตัวและช่วยโลกของเรา',
        'screen': m3_lesson2_p1(),
      },
    ];

    return Scaffold(
      appBar: buildAppBar(
        'Module 3',
        context,
      ),
      body: Padding(
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
    );
  }
}