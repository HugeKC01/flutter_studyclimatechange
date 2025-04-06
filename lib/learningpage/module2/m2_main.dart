import 'package:flutter/material.dart';

import 'lesson1/m2_lesson1_p1.dart';
import 'lesson2/m2_lesson2_p1.dart';

class Module2Screen extends StatelessWidget {
  const Module2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 1: Introduction to Climate Change'),
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
                    borderRadius: BorderRadius.circular(15.0)),
                  elevation: 5.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
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
                              Text('The Effect of Climate Change'),
                              Text('ผลกระทบจากการเปลี่ยนไปของภูมิอากาศ'),
                            ],
                          ),
                          trailing: Icon(Icons.lock),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Module2Page(),
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
                    borderRadius: BorderRadius.circular(15.0)),
                  elevation: 5.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
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
                              Text('The Cause of Climate Change'),
                              Text('สาเหตุของที่ภูมิอากาศเปลี่ยนไป'),
                            ],
                          ),
                          trailing: Icon(Icons.lock),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => m2_lesson2_p1(),
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