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

class m2_learn2_p2 extends StatelessWidget {
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
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'อุณหภูมิโลกเพิ่มขึ้นจากก๊าซเรือนกระจกที่สะสมในบรรยากาศ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'โลกของเราร้อนขึ้นเพราะก๊าซเรือนกระจกเยอะเกินไป! ก๊าซเหล่านี้เหมือนผ้าห่มหนา ๆ ห่อหุ้มโลก ทำให้ความร้อนออกไปไม่ได้ อุณหภูมิโลกเลยสูงขึ้น เหมือนเวลาที่เราห่มผ้าห่มหนา ๆ แล้วรู้สึกร้อนนั่นแหละ!',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'ก๊าซเรือนกระจกมาจากหลายที่ เช่น รถยนต์ โรงงาน และการเผาขยะ เมื่อโลกของเราร้อนขึ้น น้ำแข็งขั้วโลกจะละลาย ทำให้น้ำทะเลสูงขึ้น และสัตว์หลายชนิดอาจไม่มีที่อยู่',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้ถุงผ้า เพื่อให้โลกของเราเย็นลงนะ! เราทำได้!',
                  style: TextStyle(fontSize: 16.0),
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
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'ทำให้น้ำแข็งขั้วโลกละลาย ระดับน้ำทะเลสูงขึ้น และเกิดภัยพิบัติมากขึ้น',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'อากาศที่ร้อนขึ้น ทำให้ก้อนน้ำแข็งใหญ่ ๆ ที่ขั้วโลกละลาย เมื่อน้ำแข็งละลาย น้ำก็จะไหลลงทะเล ทำให้ระดับน้ำทะเลสูงขึ้น เหมือนเวลาที่เราใส่น้ำแข็งในแก้วน้ำ แล้วน้ำแข็งละลาย น้ำในแก้วก็จะสูงขึ้น',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อน้ำทะเลสูงขึ้น น้ำก็จะท่วมบ้านเรือนที่อยู่ใกล้ทะเล สัตว์ที่อาศัยอยู่แถวชายฝั่งก็จะไม่มีที่อยู่ นอกจากนี้ อากาศที่ร้อนขึ้นยังทำให้เกิดพายุและภัยพิบัติอื่น ๆ มากขึ้น เช่น น้ำท่วม แผ่นดินไหว และไฟป่า',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้ถุงผ้า เพื่อให้โลกของเราเย็นลง และป้องกันไม่ให้เกิดภัยพิบัติเหล่านี้มากขึ้นนะ!',
                  style: TextStyle(fontSize: 16.0),
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
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'พื้นที่แห้งแล้งเพิ่มขึ้นและส่งผลต่อการเพาะปลูกอาหาร',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น อากาศก็จะแห้งแล้งมากขึ้น ทำให้ดินแตกระแหงและปลูกพืชไม่ได้เหมือนเดิม เหมือนเวลาที่เราไม่ได้รดน้ำต้นไม้ ต้นไม้ก็จะเหี่ยวเฉาและตายไป',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อไม่มีน้ำและดินไม่ดี เกษตรกรก็ปลูกข้าว ผัก และผลไม้ไม่ได้ ทำให้เราไม่มีอาหารกิน และอาหารก็จะมีราคาแพงขึ้น เหมือนเวลาที่เราอยากกินขนม แต่ร้านค้าไม่มีขนมขาย เราก็ต้องจ่ายเงินแพงขึ้นเพื่อซื้อขนม',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้น้ำอย่างประหยัด เพื่อให้โลกของเราเย็นลง และมีอาหารกินกันอย่างเพียงพอนะ!',
                  style: TextStyle(fontSize: 16.0),
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
                            'เรื่องที่ 2.1',
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
    );
  }
}
