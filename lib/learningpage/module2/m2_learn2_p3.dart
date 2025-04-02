import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  // เปลี่ยนเป็น StatefulWidget เพื่อจัดการ state
  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  bool _isPressed = false; // state สำหรับตรวจสอบว่าปุ่มถูกกดหรือไม่

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
        Navigator.pop(context); // กลับไปยังหน้าก่อนหน้าเมื่อปล่อยปุ่ม
      },
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 255, 255, 255),
          border:
              _isPressed
                  ? Border.all(
                    color: Colors.blue,
                    width: 4.0,
                  ) // เพิ่ม border สีน้ำเงินเมื่อกด
                  : null, // ไม่แสดง border เมื่อไม่กด
        ),
        child: Center(
          // ใช้ Center เพื่อจัดไอคอนให้อยู่ตรงกลาง
          child: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 171, 212, 223),
          ),
        ),
      ),
    );
  }
}

class m2_learn2_p3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // เนื้อหาหลักของหน้าจอ (เลื่อนได้)
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
                  // เพิ่ม margin ด้านบนของข้อความ
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'ระบบนิเวศเปลี่ยนแปลง ทำให้สัตว์และพืชบางชนิดสูญพันธุ์',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  // เพิ่ม margin ด้านบนของรูปภาพ
                  padding: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    // เพิ่มขอบมนให้กับรูปภาพ
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // กำหนดรัศมีของขอบมน
                    child: Container(
                      height: 250.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ),
                Padding(
                  // เพิ่ม margin ด้านบนของข้อความ
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    'ปะการังฟอกขาวจากอุณหภูมิน้ำทะเลที่สูงขึ้น',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  // เพิ่ม margin ด้านบนของรูปภาพ
                  padding: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    // เพิ่มขอบมนให้กับรูปภาพ
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // กำหนดรัศมีของขอบมน
                    child: Container(
                      height: 250.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ),
                Padding(
                  // เพิ่ม margin ด้านบนของข้อความ
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    'ปัญหามลพิษทางอากาศและน้ำส่งผลต่อสุขภาพของมนุษย์และสัตว์',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  // เพิ่ม margin ด้านบนของรูปภาพ
                  padding: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    // เพิ่มขอบมนให้กับรูปภาพ
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // กำหนดรัศมีของขอบมน
                    child: Container(
                      height: 250.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // กล่องข้อความสีฟ้าอ่อนที่ติดอยู่ด้านบน
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              // ใช้ Column เพื่อวาง Container และ Row ในแนวตั้ง
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
                            'เรื่องที่ 2.3',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'อธิบายผลกระทบที่มีต่อสิ่งแวดล้อม',
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
    );
  }
}
