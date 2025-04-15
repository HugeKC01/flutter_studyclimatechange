import 'package:flutter/material.dart';
import 'dart:math';
import 'raindrop.dart';

class RainOverlay extends StatefulWidget {
  final int? numberOfRaindrops;
  final double screenWidth;

  const RainOverlay({
    super.key,
    this.numberOfRaindrops,
    required this.screenWidth,
  });

  @override
  State<RainOverlay> createState() => _RainOverlayState();
}

class _RainOverlayState extends State<RainOverlay>
    with SingleTickerProviderStateMixin {
  late List<RaindropData> _raindrops;
  late AnimationController _controller;
  late Animation<double> _animation = const AlwaysStoppedAnimation(0.0);
  final Random _random = Random();
  late Size _screenSize = Size.zero;

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
        _initializeRaindrops();
      }
    });
  }

  void _initializeRaindrops() {
    if (_screenSize == Size.zero) {
      return;
    }

    final int calculatedRaindrops =
        widget.numberOfRaindrops ?? (widget.screenWidth / 10).ceil();

    _raindrops = List.generate(calculatedRaindrops, (_) {
      return RaindropData(
        x: _random.nextDouble() * _screenSize.width,
        y: _random.nextDouble() * _screenSize.height * 0.5 - 50,
        length: _random.nextDouble() * 10 + 10,
        speed: _random.nextDouble() * 15 + 15,
        opacity: _random.nextDouble() * 0.5 + 0.5,
      );
    });
  }

  void _updateRaindrops(double t) {
    if (_screenSize == Size.zero || _raindrops.isEmpty) {
      return;
    }

    for (var raindrop in _raindrops) {
      raindrop.y += raindrop.speed;
      if (raindrop.y > _screenSize.height) {
        raindrop.y = -50;
        raindrop.x = _random.nextDouble() * _screenSize.width;
        raindrop.length = _random.nextDouble() * 10 + 10;
        raindrop.speed = _random.nextDouble() * 15 + 15;
        raindrop.opacity = _random.nextDouble() * 0.5 + 0.5;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newScreenSize = MediaQuery.of(context).size;
    if (_screenSize != newScreenSize) {
      _screenSize = newScreenSize;
      _initializeRaindrops();
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
        _updateRaindrops(_animation.value);
        return Stack(
          children:
              _raindrops.map((data) {
                return Raindrop(
                  x: data.x,
                  y: data.y,
                  length: data.length,
                  opacity: data.opacity,
                );
              }).toList(),
        );
      },
    );
  }
}

class RaindropData {
  double x;
  double y;
  double length;
  double speed;
  double opacity;

  RaindropData({
    required this.x,
    required this.y,
    required this.length,
    required this.speed,
    required this.opacity,
  });
}
