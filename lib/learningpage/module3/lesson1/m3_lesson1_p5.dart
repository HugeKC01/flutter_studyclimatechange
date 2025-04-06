import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';


class Module3l1p5 extends StatelessWidget {
  const Module3l1p5 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'เรื่องที่ 1' ,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Container(
        // Background decoration for the entire screen
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/module1/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 106, 117, 142),
                            Color.fromARGB(255, 214, 237, 252)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const SizedBox(height: 12),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 214, 237, 252),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'เรื่องที่ 1 ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1.1.1)ขยะในครัว',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 214, 237, 252),
                            Color.fromARGB(255, 75, 82, 142)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const SizedBox(height: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        color: const Color.fromARGB(200, 255, 255, 255),
                        elevation: 4,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• เศษอาหาร',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                               Text(
                                '         ควรนำไปทำปุ๋ยหมักหรือนำไปเลี้ยงสัตว์เพื่อลดขยะอินทรีย์ (ทิ้งในขยะอินทรีย์ - สีเขียว)',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              
                              const SizedBox(height: 12),
                              Center(
                                child: HoverableImage(
                                  imagePath: 'asset/module3/s1m14.jpg',
                                ),
                              ),
                              Text(
                                '• น้ำมันที่ใช้แล้ว',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                               Text(
                                '         รอให้เย็นแล้วเทใส่ขวด นำไปทิ้งที่ถังขยะทั่วไป (สีน้ำเงิน) หรือจะนำไปบริจาคหรือขายให้กับสถานที่รับซื้อน้ำมันใช้แล้วเพื่อแปรรูปน้ำมันไบโอดีเซล',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              
                              const SizedBox(height: 12),
                              Center(
                                child: HoverableImage(
                                  imagePath: 'asset/module3/s1m15.jpg',
                                ),
                              ),
                              Text(
                                '• กล่องโฟม',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                               Text(
                                '         หลีกเลี่ยงการใช้หากเป็นไปได้ เพราะย่อยสลายยาก ควรแยกทิ้งในถังขยะทั่วไป (สีน้ำเงิน) หรือจุดรับกำจัดขยะโฟมโดยเฉพาะ',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              
                              const SizedBox(height: 12),
                              Center(
                                child: HoverableImage(
                                  imagePath: 'asset/module3/s1m16.jpg',
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
            ),
            // Fixed footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 122, 255),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'btnBack',
                          onPressed: () {
                            
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.arrow_back,
                              size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                              
                        ),
                      ),
                    ),
                  ),
                  // Forward button
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 122, 255),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'btnForward',
                          onPressed: () {
                           
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.arrow_forward,
                              size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableImage extends StatefulWidget {
  final String imagePath; // เส้นทางของรูปภาพ

  const HoverableImage({super.key, required this.imagePath});

  @override
  HoverableImageState createState() => HoverableImageState();
}

class HoverableImageState extends State<HoverableImage> {
  bool _isHovered = false; // สถานะ hover หรือกดค้าง

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isHovered = true; // เมื่อกดค้าง
        });
      },
      onTapUp: (_) {
        setState(() {
          _isHovered = false; // เมื่อปล่อย
        });
      },
      onTapCancel: () {
        setState(() {
          _isHovered = false; // เมื่อยกเลิกการกด
        });
      },
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 200), // ระยะเวลาในการเปลี่ยนแปลง
        curve: Curves.easeInOut, // ลักษณะการเคลื่อนไหว
        alignment: _isHovered
            ? const Alignment(-0.1, 0.0) // ขยับไปทางซ้ายเล็กน้อยเมื่อ hover
            : Alignment.center, // ตำแหน่งปกติ
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // ระยะเวลาในการเปลี่ยนแปลง
          curve: Curves.easeInOut, // ลักษณะการเคลื่อนไหว
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // เส้นขอบสีขาว
              width: 4.0, // ความหนาของเส้นขอบ
            ),
            borderRadius: BorderRadius.circular(16.0), // กำหนดขอบมน
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.2 * 255).toInt()), // ใช้ withAlpha แทน withOpacity
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.1)) // ขยายขนาดเมื่อ hover
              : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // กำหนดขอบมนให้กับรูปภาพ
            child: Image.asset(
              widget.imagePath, // ใช้เส้นทางรูปภาพจากพารามิเตอร์
              width: MediaQuery.of(context).size.width * (_isHovered ? 0.4 : 0.4), // ขยายขนาดเมื่อ hover
              fit: BoxFit.contain, // ปรับขนาดรูปภาพให้พอดี
            ),
          ),
        ),
      ),
    );
  }
}

