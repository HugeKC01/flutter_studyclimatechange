import 'package:flutter/material.dart';
import 'dart:math';
import 'raindrop.dart';

class RainOverlay extends StatefulWidget {
  final double screenWidth;

  const RainOverlay({super.key, required this.screenWidth});

  @override
  State<RainOverlay> createState() => _RainOverlayState();
}

class _RainOverlayState extends State<RainOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<_RaindropData> _raindrops = [];
  final Random _random = Random();
  final double _intensity = 0.2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 1500,
      ), // ปรับ duration สำหรับความเร็ว
      vsync: this,
    )..repeat();
    // ย้ายการเรียก _generateRaindrops() ไปที่ didUpdateWidget() หรือ didChangeDependencies()
  }

  @override
  void didUpdateWidget(covariant RainOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.screenWidth != widget.screenWidth) {
      _generateRaindrops();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateRaindrops(); // เรียกที่นี่เพื่อให้แน่ใจว่า context พร้อมใช้งาน
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateRaindrops() {
    if (!mounted) return; // ตรวจสอบว่า Widget ยังอยู่ใน Tree
    _raindrops.clear();
    final screenHeight =
        MediaQuery.of(context).size.height; // เข้าถึง MediaQuery ที่นี่
    final int numberOfRaindrops =
        (widget.screenWidth * 1.5 * _intensity).floor();
    for (int i = 0; i < numberOfRaindrops; i++) {
      _raindrops.add(
        _RaindropData(
          x: _random.nextDouble() * widget.screenWidth,
          y: _random.nextDouble() * screenHeight,
          length: _random.nextDouble() * 15 + 5,
          speed: _random.nextDouble() * 10 + 5,
          opacity: _random.nextDouble() * 0.8, // ตั้งค่าความจางที่นี่โดยตรง
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children:
              _raindrops.map((raindrop) {
                final double yPosition =
                    raindrop.y +
                    _controller.value *
                        MediaQuery.of(context).size.height *
                        raindrop.speed /
                        10;
                return Raindrop(
                  x: raindrop.x,
                  y: yPosition % MediaQuery.of(context).size.height,
                  length: raindrop.length,
                  opacity: raindrop.opacity,
                );
              }).toList(),
        );
      },
    );
  }
}

class _RaindropData {
  double x;
  double y;
  double length;
  double speed;
  double opacity;

  _RaindropData({
    required this.x,
    required this.y,
    required this.length,
    required this.speed,
    required this.opacity,
  });
}
