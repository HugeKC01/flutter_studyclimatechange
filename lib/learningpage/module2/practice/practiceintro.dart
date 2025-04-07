import 'package:flutter/material.dart';
import 'practice.dart';

class PracticeM2Introduction extends StatelessWidget {
  const PracticeM2Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Introduction'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
        child: Opacity(
          opacity: 0.08, // Adjust the opacity value as needed
          child: Image.asset(
            'asset/overall/background1.png', // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
          ),
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            const Text(
          'ยินต้อนรับเข้าสู่แบบทดสอบ Module 1!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),

            // Description
            const Text(
          'แบบทดสอบนี้จะช่วยให้คุณเข้าใจเนื้อหาที่เรียนได้ดียิ่งขึ้น '
          'โดยการตอบคำถามที่เกี่ยวข้องกับเนื้อหาที่เรียนใน Module 1',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),

            // Instructions
            ..._buildInstructions(),

            const SizedBox(height: 32.0),

            // Start Post Test Button
            ElevatedButton(
          onPressed: () {
            // Navigate to the post-test screen
            Navigator.push(
              context,
              MaterialPageRoute(
            builder: (context) => const PracticeM2Screen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text(
            'เริ่มแบบทดสอบ Module 1',
            style: TextStyle(fontSize: 18.0),
          ),
            ),
          ],
        ),
          ),
        ],
      ),
    );
  }

  // Helper method to build instruction cards
  List<Widget> _buildInstructions() {
    const instructions = [
      '1. กิจกรรมนี้มีทั้งหมด 5 ข้อ',
      '2. ไม่มีการจำกัดเวลาในการทำกิจกรรม',
      '3. เมื่อคุณส่งคำตอบแล้วจะไม่สามารถเปลี่ยนแปลงคำตอบได้',
      '4. ไม่มีการเฉลยคำตอบเมื่อคุณทำกิจกรรมเสร็จสิ้น',
    ];

    return instructions
        .map(
          (instruction) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  instruction,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}