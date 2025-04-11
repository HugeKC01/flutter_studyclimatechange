import 'package:flutter/material.dart';
import 'dart:math';
import 'snowflake.dart';

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
  late Animation<double> _animation = const AlwaysStoppedAnimation(0.0);
  final Random _random = Random();
  late Size _screenSize = Size.zero; // กำหนดค่าเริ่มต้นให้กับ _screenSize

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _screenSize = MediaQuery.of(context).size;
        _initializeSnowflakes(); // เรียก _initializeSnowflakes() ทันทีที่ได้ขนาดหน้าจอ
      }
    });
  }

  void _initializeSnowflakes() {
    if (_screenSize == Size.zero)
      return; // ป้องกันการทำงานถ้า _screenSize ยังเป็นค่าเริ่มต้น

    _snowflakes = List.generate(widget.numberOfSnowflakes, (_) {
      return SnowflakeData(
        x: _random.nextDouble() * _screenSize.width,
        y: _random.nextDouble() * _screenSize.height * 0.5 - 50,
        size: _random.nextDouble() * 4 + 4,
        speed: _random.nextDouble() * 2 + 1,
        opacity: _random.nextDouble() * 0.5 + 0.5,
      );
    });
  }

  void _updateSnowflakes(double t) {
    if (_screenSize == Size.zero || _snowflakes == null)
      return; // ป้องกันการทำงานถ้ายังไม่มีขนาดหรือเกล็ดหิมะ

    for (var snowflake in _snowflakes) {
      snowflake.y += snowflake.speed;
      if (snowflake.y > _screenSize.height) {
        snowflake.y = -50;
        snowflake.x = _random.nextDouble() * _screenSize.width;
        snowflake.size = _random.nextDouble() * 4 + 4;
        snowflake.speed = _random.nextDouble() * 2 + 1;
        snowflake.opacity = _random.nextDouble() * 0.5 + 0.5;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newScreenSize = MediaQuery.of(context).size;
    if (_screenSize != newScreenSize) {
      _screenSize = newScreenSize;
      _initializeSnowflakes();
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
              _snowflakes?.map((data) {
                // ใช้ ?. เพื่อป้องกัน error ถ้า _snowflakes ยังไม่ถูก initialize
                return Snowflake(
                  x: data.x,
                  y: data.y,
                  size: data.size,
                  opacity: data.opacity,
                );
              })?.toList() ??
              [], // ถ้า _snowflakes เป็น null ให้คืน List ว่าง
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
