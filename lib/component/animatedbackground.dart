import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class AnimatedBackground extends StatefulWidget {
  final Widget? child;
  const AnimatedBackground({Key? key, this.child}) : super(key: key);

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  final List<List<Color>> gradientColors = [
    [Color(0xFF87D7FF), Color(0xFFB2FFB2)],
    [Color(0xFFFFE082), Color(0xFFFFB2B2)],
    [Color(0xFFB2B2FF), Color(0xFFFFB2F6)],
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            index = (index + 1) % gradientColors.length;
            _setGradientAnimations();
            _controller.forward(from: 0);
          });
        }
      });

    _setGradientAnimations();
    _controller.forward();
  }

  void _setGradientAnimations() {
    final nextIndex = (index + 1) % gradientColors.length;
    _color1 = ColorTween(
      begin: gradientColors[index][0],
      end: gradientColors[nextIndex][0],
    ).animate(_controller);
    _color2 = ColorTween(
      begin: gradientColors[index][1],
      end: gradientColors[nextIndex][1],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double globeSize = screenWidth > 900 ? 900 : screenWidth;
    double cloudSize = globeSize * 2;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _color1.value ?? gradientColors[index][0],
                _color2.value ?? gradientColors[index][1],
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // 🌍 Rotating globe (behind)
              Positioned(
                bottom: -globeSize / 2,
                left: (screenWidth - globeSize) / 2,
                child: SizedBox(
                  width: globeSize,
                  height: globeSize,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        alignment: Alignment.center,
                        angle: _controller.value * 2 * pi,
                        child: child,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'asset/overall/icon.png',
                        width: globeSize,
                        height: globeSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              // 🌥️ Rotating cloud (in front)
              Positioned(
                bottom: -globeSize,
                left: (screenWidth - cloudSize) / 2,
                child: SizedBox(
                  width: cloudSize,
                  height: cloudSize,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        alignment: Alignment.center,
                        angle: _controller.value * 2 * pi,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'asset/overall/cloud.png',
                      width: cloudSize,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              // Foreground child content
              if (widget.child != null) widget.child!,
            ],
          ),
        );
      },
    );
  }
}

