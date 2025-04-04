import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'lesson1/m3_lesson1_p1.dart';
import 'lesson2/m3_lesson2_p1.dart'; // Import the m3_learn2_p1.dart file where the CustomBackButton widget is defined.

class Module3Screen extends StatelessWidget {
  const Module3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Module 3', // Replace with a valid title string
        context,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Cover Section',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          title: Text('บทเรียนที่ 1'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lets Fix The Climate Change Problem'),
                              Text('มาแก้ไขปัญหาที่ทำให้ภูมิอากาศเปลี่ยนไปกันเถอะ'),
                            ],
                          ),
                          trailing: Icon(Icons.lock),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => m3_lesson1_p1(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
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
                                builder: (context) => m3_lesson1_p1(),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Cover Section',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          title: Text('บทเรียนที่ 2'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Adapting and saving our world'),
                              Text('การปรับตัวและช่วยโลกของเรา'),
                            ],
                          ),
                          trailing: Icon(Icons.lock),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => m3_lesson2_p1(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
