import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text('Manual'),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: SizedBox(
              height: cardHeight,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Step ${index + 1}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
