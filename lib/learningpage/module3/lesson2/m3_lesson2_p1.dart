import 'package:flutter/material.dart';
import '../m3_main.dart';
import 'm3_lesson2_p2.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';

class Module3l2p1 extends StatelessWidget {
  const Module3l2p1({super.key});

  @override
  Widget build(BuildContext context) {
    final pagetitle = 'เรื่องที่ 2 การปรับตัวและการใช้ชีวิต';
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.1) วิธีปรับตัวและใช้ชีวิตต่ออุณหภูมิที่เปลี่ยนแปลง';
    final background = 'asset/overall/background1.png';
    const fontsize = 20.0;
    final int totalPages = PageConfig.lessonPageCounts['m3lesson2'] ?? 6;

    return Scaffold(
      appBar: buildAppBar(
        pagetitle,
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
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
                         builder: (context) => const Module3Screen(),
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
                                    '         การเปลี่ยนแปลงของสภาพภูมิอากาศทำให้มนุษย์และสิ่งมีชีวิตต้องปรับตัวหลายด้าน เช่น'
                                    'สัตว์ บางสายพันธุ์อพยพไปยังพื้นที่ที่มีสภาพแวดล้อมเหมาะสมกว่า มนุษย์ ปรับเปลี่ยนวิถีชีวิต การสร้างที่อยู่อาศัยที่ทนทานต่อภัยพิบัติ ',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '\n1. วิธีปรับตัวและใช้ชีวิตเมื่ออากาศร้อนขึ้น',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    '         สภาพอากาศที่ร้อนขึ้นกว่าเดิม ทำให้เราต้องรู้จักวิธีดูแลตัวเองและปรับตัวให้เข้ากับอากาศที่ร้อนขึ้น เช่น '
                                    'เมื่ออากาศร้อน ร่างกายของเราจะเสียเหงื่อมากขึ้น เราต้องดื่มน้ำให้เพียงพอ อย่างน้อยวันละ 6-8 แก้ว หาที่ร่มและอยู่ในที่เย็นถ้าอากาศข้างนอกร้อนจัด พยายามอยู่ในที่ร่มหรือในห้องที่มีพัดลมหรือแอร์ ปลูกต้นไม้รอบบ้านเพื่อลดอุณหภูมิในบ้าน',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module3/m3_l2_p1.png',
                                    ),
                                  ),
                                  const SizedBox(height: 12),
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
                FooterNavigation(
                  onBackPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3Screen()),
                    );
                  },
                  onForwardPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Module3l2p2()),
                    );
                  },
                  currentPage: 1, // Current page index
                  totalPages: totalPages,  // Total number of pages
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}