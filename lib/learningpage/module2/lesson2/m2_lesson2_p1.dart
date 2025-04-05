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

class m2_lesson2_p1 extends StatelessWidget {
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
                    'ฤดูฝนและฤดูร้อนเปลี่ยนแปลงไป ทำให้เกิดฝนตกหนักหรือแล้งผิดปกติ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น ฤดูฝนและฤดูร้อนก็เปลี่ยนไป! ฝนอาจตกหนักจนน้ำท่วม หรือบางที่ก็แห้งแล้งจนไม่มีน้ำใช้เลย เหมือนเวลาที่เราเล่นเกม แล้วกฎกติกาเปลี่ยนไป เราก็ต้องเล่นเกมแบบใหม่',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'อากาศที่ร้อนขึ้นทำให้เกิดพายุและภัยพิบัติมากขึ้น เช่น พายุที่รุนแรงขึ้น น้ำท่วม แผ่นดินไหว และไฟป่า เหมือนเวลาที่เราเป่าลูกโป่งจนใหญ่เกินไป ลูกโป่งก็จะแตก',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้น้ำอย่างประหยัด เพื่อให้โลกของเราเย็นลง และป้องกันไม่ให้เกิดภัยพิบัติเหล่านี้มากขึ้นนะ!',
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
                    'ฤดูหนาวอาจสิ้นลงหรือรุนแรงขึ้นในบางพื้นที่',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น ฤดูหนาวก็เปลี่ยนไป! บางที่ฤดูหนาวอาจสั้นลงจนแทบไม่มีอากาศหนาวเลย หรือบางที่อาจมีอากาศหนาวจัดและยาวนานกว่าเดิม เหมือนเวลาที่เราเล่นเกม แล้วกฎกติกาเปลี่ยนไป เราก็ต้องเล่นเกมแบบใหม่',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'อากาศที่ร้อนขึ้นทำให้เกิดพายุและภัยพิบัติมากขึ้น เช่น พายุที่รุนแรงขึ้น น้ำท่วม แผ่นดินไหว และไฟป่า เหมือนเวลาที่เราเป่าลูกโป่งจนใหญ่เกินไป ลูกโป่งก็จะแตก',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้น้ำอย่างประหยัด เพื่อให้โลกของเราเย็นลง และป้องกันไม่ให้เกิดภัยพิบัติเหล่านี้มากขึ้นนะ!',
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
                    'พายุและภัยธรรมชาติเกิดขึ้นบ่อยขึ้นและมีความรุนแรงมากขึ้น',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น พายุและภัยธรรมชาติก็รุนแรงมากขึ้น! พายุอาจแรงจนพัดบ้านพัง น้ำท่วมสูงขึ้น แผ่นดินไหวรุนแรงขึ้น และไฟป่าลุกลามเร็วขึ้น เหมือนเวลาที่เราเล่นเกม แล้วมีคนโกง ทำให้เกมยากขึ้น',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'อากาศที่ร้อนขึ้นทำให้เกิดภัยพิบัติเหล่านี้บ่อยขึ้น เหมือนเวลาที่เราเป่าลูกโป่งจนใหญ่เกินไป ลูกโป่งก็จะแตกบ่อยขึ้น',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้น้ำอย่างประหยัด เพื่อให้โลกของเราเย็นลง และป้องกันไม่ให้เกิดภัยพิบัติเหล่านี้มากขึ้นนะ!',
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
                            'เรื่องที่ 2.2',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'อธิบายสภาพอากาศผิดฤดู',
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
