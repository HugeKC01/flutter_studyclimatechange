import 'package:flutter/material.dart';

class Module2Screen extends StatelessWidget {
  const Module2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 2: Effects of Climate Change'),
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
                          title: Text('Post Test'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Adapting and saving our world'),
                              Text('การปรับตัวและช่วยโลกของเรา'),
                            ],
                          ),
                          trailing: Icon(Icons.lock),
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
                          title: Text('Post Test'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Adapting and saving our world'),
                              Text('การปรับตัวและช่วยโลกของเรา'),
                            ],
                          ),
                          trailing: Icon(Icons.lock),
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