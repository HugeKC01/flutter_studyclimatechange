import 'package:flutter/material.dart';
import 'dart:math';
import 'snowflake.dart'; // Import Snowflake widget ที่เราสร้าง

class SnowfallOverlay extends StatefulWidget {
  final int numberOfSnowflakes;

  const SnowfallOverlay({super.key, this.numberOfSnowflakes = 50});

  @override
  State<SnowfallOverlay> createState() => _SnowfallOverlayState();
}

class _SnowfallOverlayState extends State<SnowfallOverlay>
    with SingleTickerProviderStateMixin {
  late List<SnowflakeData> _snowflakes;
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random _random = Random();
  late Size _screenSize;

  @override
  void initState() {
    super.initState();
    _initializeSnowflakes();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // ปรับความเร็วในการตกที่นี่
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
  }

  void _initializeSnowflakes() {
    _snowflakes = List.generate(widget.numberOfSnowflakes, (_) {
      return SnowflakeData(
        x: _random.nextDouble() * _screenSize.width,
        y:
            _random.nextDouble() * _screenSize.height * 0.5 -
            50, // เริ่มจากด้านบน
        size: _random.nextDouble() * 4 + 4, // ขนาดเกล็ดหิมะ
        speed: _random.nextDouble() * 2 + 1, // ความเร็วในการตก
        opacity: _random.nextDouble() * 0.5 + 0.5, // ความโปร่งใส
      );
    });
  }

  void _updateSnowflakes(double t) {
    for (var snowflake in _snowflakes) {
      snowflake.y += snowflake.speed;
      if (snowflake.y > _screenSize.height) {
        snowflake.y = -50; // รีเซ็ตให้กลับไปด้านบน
        snowflake.x = _random.nextDouble() * _screenSize.width;
        snowflake.size = _random.nextDouble() * 4 + 4;
        snowflake.speed = _random.nextDouble() * 2 + 1;
        snowflake.opacity = _random.nextDouble() * 0.5 + 0.5;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        _updateSnowflakes(_animation.value);
        return Stack(
          children:
              _snowflakes.map((data) {
                return Snowflake(
                  x: data.x,
                  y: data.y,
                  size: data.size,
                  opacity: data.opacity,
                );
              }).toList(),
        );
      },
    );
  }
}

class SnowflakeData {
  double x;
  double y;
  double size;
  double speed;
  double opacity;

  SnowflakeData({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}
