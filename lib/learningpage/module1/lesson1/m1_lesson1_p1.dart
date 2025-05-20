import 'package:flutter/material.dart';
import '../m1_main.dart';
import 'm1_lesson1_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module1l1p1 extends StatelessWidget {
  const Module1l1p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 1 ทำความรู้จักการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final pageheader = 'เรื่องที่ 1';
    final pagesubtitle = '1.1) ความหมายของสภาพอากาศและภูมิอากาศ';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m1lesson1'] ?? 1;

    return Scaffold(
      appBar: buildAppBar(pagetitle, context),
      drawer: buildDrawer(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Adjust the opacity value as needed
              child: Image.asset(
                background, // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                ArticleHeader(
                   header: pageheader,
                   subtitle: pagesubtitle,
                   fontSize: fontsize,
                   onExit: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const Module1Screen(),
                       ),
                     );
                   },
                 ),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 600,
                              ),
                              child: Card(
                                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                elevation: 4,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '         สภาพอากาศและภูมิอากาศเป็นคำที่มักถูกใช้สลับกัน แต่จริง ๆ แล้วมีความหมายที่แตกต่างกัน',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: fontsize),
                                      ),
                                      const SizedBox(height: 8),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '         สภาพอากาศ (weather)',
                                              style: TextStyle(
                                                fontSize: fontsize,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' หมายถึง สภาพอากาศที่เกิดขึ้นในช่วงเวลาสั้น ๆ เช่น ชั่วโมง วัน หรือสัปดาห์ โดยจะมีการเปลี่ยนแปลงอยู่ตลอดเวลา เช่น อาจมีฝนตกในช่วงเช้า แต่แดดออกในช่วงบ่าย',
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(fontSize: fontsize),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: component.HoverableImage(
                                          imagePath: 'asset/module1/weather.png',
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: '         ภูมิอากาศ (climate)',
                                              style: TextStyle(
                                                fontSize: fontsize,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const TextSpan(
                                              text:
                                                  ' หมายถึง สภาพอากาศที่เกิดขึ้นในสถานที่หนึ่งๆบนโลก เป็นช่วงเวลาที่ยาวนาน เช่น เดือน ปี หรือหลายปี โดยจะมีการเปลี่ยนแปลงอยู่ตลอดเวลาเช่นกัน แต่จะมีการเปลี่ยนแปลงที่ช้ากว่าและมีแนวโน้มที่ชัดเจนกว่า เช่น อาจมีอุณหภูมิสูงขึ้นในช่วงฤดูร้อน และมีอุณหภูมิต่ำลงในช่วงฤดูหนาว',
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(fontSize: fontsize),
                                      ),
                                      const SizedBox(height: 8),
                                      Center(
                                        child: component.HoverableImage(
                                          imagePath: 'asset/module1/climate.png',
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                       //toggle between weather and climate example
                                      WeatherVsClimateToggle(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Fixed footer
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module1Screen(),
                      ),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Module1l1p2(),
                      ),
                    );
                  },
                  currentPage: 1, // Current page index
                  totalPages: totalPages, // Total number of pages
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// สร้าง widget ที่ใช้ในการสลับระหว่างตัวอย่างสภาพอากาศและภูมิอากาศ
class WeatherVsClimateToggle extends StatefulWidget {
  @override
  _WeatherVsClimateToggleState createState() => _WeatherVsClimateToggleState();
}

class _WeatherVsClimateToggleState extends State<WeatherVsClimateToggle> 
    with SingleTickerProviderStateMixin {
  bool isWeather = true;
  late AnimationController _controller;
  // สร้าง AnimationController ที่ใช้ในการควบคุมอนิเมชัน
 
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );// กำหนดระยะเวลาอนิเมชันเป็น 500 มิลลิวินาที
      
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        // สถานะของอนิเมชันที่ใช้ในการสลับระหว่างสภาพอากาศและภูมิอากาศ
      }
    });
  }
  void toggle() {
    if (_controller.isAnimating) return; // ตรวจสอบว่าอนิเมชันกำลังทำงานอยู่หรือไม่
    // สลับระหว่างสภาพอากาศและภูมิอากาศ
    setState(() {
      isWeather = !isWeather;
      if (isWeather) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }
  @override
  void dispose() {//เมื่อ widget นี้เปลี่ยนสถานะให้ยกเลิกการควบคุมอนิเมชัน
    _controller.dispose();
    super.dispose();
  }
  // สร้าง widget ที่ใช้ในการแสดงผล ให้เนื้อหาอยู่ตรงกลาง
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: toggle,
            child: AnimatedContainer(// ใช้ AnimatedContainer เพื่อสร้างอนิเมชันการเปลี่ยนแปลงสี
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: isWeather ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        // ใช้ AnimatedSwitcher เพื่อสร้างอนิเมชันเปลี่ยนเนื้อหาด้วยการใช้ ScaleTransition 
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(scale: animation, child: child);
                        },
                        child: Icon(
                          isWeather ? Icons.wb_sunny : Icons.terrain,
                          key: ValueKey<bool>(isWeather),
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        isWeather ? 'สภาพอากาศ' : 'สภาพภูมิอากาศ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    // ใช้ AnimatedSwitcher เพื่อสร้างอนิเมชันเปลี่ยนเนื้อหาตัวอย่างด้วยการใช้ FadeTransition
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Column(
                      key: ValueKey<bool>(isWeather),
                      children: isWeather
                          ? [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.water_drop_outlined, color: Colors.white),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'สัปดาห์ที่แล้วมีฝนตกชุก',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.wb_sunny_outlined, color: Colors.white),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'แดดออกในช่วงบ่าย',
                                    style: TextStyle(color: Colors.white, fontSize:16),
                                  ),
                                ],
                              ),
                            ]
                          : [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.thermostat, color: Colors.white),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'อุณหภูมิสูงขึ้นในช่วงฤดูร้อน',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.water, color: Colors.white),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'ปีนี้มีปริมาณน้ำฝนมากกว่าปีที่แล้ว',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(// สร้างปุ่มเพื่อสลับระหว่างสภาพอากาศและภูมิอากาศ
            onPressed: toggle,
            child: Text(isWeather ? 'ภูมิอากาศ' : 'สภาพอากาศ'),
          ),
          const SizedBox(height: 20),
          const Text(
            'ลองคลิกที่ปุ่มเพื่อเปลี่ยนระหว่างสภาพอากาศและภูมิอากาศ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}