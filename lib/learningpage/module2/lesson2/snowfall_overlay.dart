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
  late Size _screenSize;

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
        _initializeSnowflakes();
      }
    });
  }

  void _initializeSnowflakes() {
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
    // ไม่จำเป็นต้องกำหนด _screenSize ที่นี่อีก
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
