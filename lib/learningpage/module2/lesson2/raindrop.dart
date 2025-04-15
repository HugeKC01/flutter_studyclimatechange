import 'package:flutter/material.dart';

class Raindrop extends StatelessWidget {
  final double x;
  final double y;
  final double length;
  final double opacity;

  const Raindrop({
    super.key,
    required this.x,
    required this.y,
    required this.length,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Opacity(
        opacity: opacity,
        child: CustomPaint(
          size: Size(1, length),
          painter: RaindropPainter(
            color: const Color.fromARGB(255, 0, 127, 247),
          ),
        ),
      ),
    );
  }
}

class RaindropPainter extends CustomPainter {
  final Color color;

  RaindropPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is RaindropPainter) {
      return oldDelegate.color != color;
    }
    return true;
  }
}
