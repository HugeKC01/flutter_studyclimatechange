import 'package:flutter/material.dart';
import 'package:climatechange/main.dart'; // Import the main.dart file where the reusable navbar widgets are defined.
//
import 'package:climatechange/style/style.dart' as style;

//pages
import 'm2_lesson2_p3.dart'; // Import m3_learn2_p2.dart file where the next screen is defined.

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({super.key});

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        Navigator.pop(context);
      },
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 255, 255, 255),
          border:
              _isPressed ? Border.all(color: Colors.blue, width: 4.0) : null,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 171, 212, 223),
          ),
        ),
      ),
    );
  }
}

class m2_lesson2_p2 extends StatelessWidget {
  const m2_lesson2_p2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Module 2: Global Warming'),
        elevation: 5.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Handle the button press here
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text('Home'),
              onTap: () {
                // Handle the home tap here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Climate Change App')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_rounded),
              title: Text('Manual'),
              onTap: () {
                // Handle the manual tap here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Main Scrollable Content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 150.0,
              left: 30.0,
              right: 30.0,
              bottom: 25.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'lorem ipson',
                    style: TextStyle(fontSize: style.fontSizeBody),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 250.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    'ทำให้น้ำแข็งขั้วโลกละลาย ระดับน้ำทะเลสูงขึ้น และเกิดภัยพิบัติมากขึ้น',
                    style: TextStyle(fontSize: style.fontSizeBody),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 250.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    'พื้นที่แห้งแล้งเพิ่มขึ้นและส่งผลต่อการเพาะปลูกอาหาร',
                    style: TextStyle(fontSize: style.fontSizeBody),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 250.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Fixed blue header section
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                Container(height: 40.0, color: Colors.lightBlue[100]),
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      CustomBackButton(),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'เรื่องที่ 2.2',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'อธิบายโลกร้อน',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 10.0, color: Colors.lightBlue[100]),
              ],
            ),
          ),
        ],
      ),
      // Add FloatingActionButton (Next button)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the next screen (replace `NextScreen` with your actual screen)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => m2_lesson2_p3(),
            ), // Next Screen
          );
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.arrow_forward), // Next icon
      ),
    );
  }
}