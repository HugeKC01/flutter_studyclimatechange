import 'package:flutter/material.dart';

class Snowflake extends StatelessWidget {
  final double x;
  final double y;
  final double size;
  final double opacity;

  const Snowflake({
    super.key,
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Opacity(
        opacity: opacity,
        child: Icon(
          Icons.grain,
          color: const Color.fromARGB(255, 54, 66, 48).withOpacity(1.0),
          size: size,
        ),
      ),
    );
  }
}
