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
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    'ระบบนิเวศเปลี่ยนแปลง ทำให้สัตว์และพืชบางชนิดสูญพันธุ์',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น ระบบนิเวศก็เปลี่ยนไป! สัตว์และพืชบางชนิดปรับตัวไม่ทัน ทำให้พวกมันหายไปจากโลกนี้ เหมือนเวลาที่เราย้ายบ้าน แล้วไม่มีของเล่นหรือเพื่อนที่เราคุ้นเคย',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'อากาศที่ร้อนขึ้นทำให้น้ำแข็งขั้วโลกละลาย น้ำทะเลสูงขึ้น และเกิดภัยพิบัติมากขึ้น เช่น พายุที่รุนแรงขึ้น น้ำท่วม แผ่นดินไหว และไฟป่า เหมือนเวลาที่เราเป่าลูกโป่งจนใหญ่เกินไป ลูกโป่งก็จะแตก',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และใช้น้ำอย่างประหยัด เพื่อให้โลกของเราเย็นลง และช่วยให้สัตว์และพืชอยู่รอดได้นะ!',
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
                    'ปะการังฟอกขาวจากอุณหภูมิน้ำทะเลที่สูงขึ้น',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น น้ำทะเลก็ร้อนขึ้นตามไปด้วย! ปะการังซึ่งเป็นบ้านของสัตว์ทะเลหลายชนิด ก็จะเครียดและปล่อยสาหร่ายสีสวย ๆ ที่อยู่ในตัวออกไป ทำให้ปะการังกลายเป็นสีขาว เราเรียกปรากฏการณ์นี้ว่า \'ปะการังฟอกขาว\'',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'ปะการังที่ฟอกขาวจะอ่อนแอลงและเสี่ยงต่อการตาย สัตว์ทะเลที่อาศัยอยู่ในปะการังก็จะไม่มีที่อยู่และอาหาร ทำให้พวกมันลดจำนวนลง และอาจสูญพันธุ์ไปในที่สุด',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และดูแลทะเล เพื่อให้โลกของเราเย็นลง และปะการังกลับมามีสีสันสวยงามเหมือนเดิมนะ!',
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
                    'ปัญหามลพิษทางอากาศและน้ำส่งผลต่อสุขภาพของมนุษย์และสัตว์',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // เพิ่มตัวหนา
                    ),
                  ),
                ),
                SizedBox(height: 12.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เมื่อโลกของเราร้อนขึ้น อากาศและน้ำก็สกปรกมากขึ้น! ควันพิษจากรถและโรงงาน ทำให้เราหายใจลำบาก และน้ำเสียจากโรงงานและขยะ ทำให้สัตว์น้ำป่วยและตาย',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'มลพิษเหล่านี้ทำให้เราเป็นโรคต่าง ๆ เช่น โรคหอบหืด โรคปอด และโรคผิวหนัง สัตว์ก็ป่วยและตายจากมลพิษเหล่านี้เช่นกัน เหมือนเวลาที่เรากินอาหารที่ไม่สะอาด เราก็จะท้องเสีย',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0), // เพิ่มระยะห่าง 10 หน่วย
                Text(
                  'เด็ก ๆ ช่วยกันลดใช้พลังงาน ปลูกต้นไม้ แยกขยะ และทิ้งขยะให้ถูกที่ เพื่อให้โลกของเราสะอาดและปลอดภัยสำหรับทุกคนนะ!',
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
