import 'package:flutter/material.dart';
import 'dart:math';

class LightningOverlay extends StatefulWidget {
  final Color color;
  final Duration baseDuration;

  const LightningOverlay({
    super.key,
    this.color = Colors.yellow,
    this.baseDuration = const Duration(milliseconds: 1000),
  });

  @override
  State<LightningOverlay> createState() => _LightningOverlayState();
}

class _LightningOverlayState extends State<LightningOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random _random = Random();
  final List<_LightningBoltData> _bolts = [];
  Size _screenSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.baseDuration,
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _generateBolts();
                _controller.reset();
                _controller.forward();
              });
            }
          });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
    _generateBolts();
    _controller.forward();
  }

  void _generateBolts() {
    if (_screenSize == Size.zero) return;
    _bolts.clear();
    final int numberOfBolts =
        (_screenSize.width / 450).floor(); // คำนวณจำนวนฟ้าผ่าและปัดเศษทิ้ง
    final List<int> delays = _generateDelays(numberOfBolts);

    for (int i = 0; i < numberOfBolts; i++) {
      _bolts.add(_generateBolt(delays[i]));
    }
  }

  List<int> _generateDelays(int count) {
    final List<int> delays = [];
    final Random random = Random();
    for (int i = 0; i < count; i++) {
      delays.add(random.nextInt(800)); // สุ่มหน่วงเวลา (ปรับช่วงได้ตามต้องการ)
    }
    delays.sort(); // เรียงหน่วงเวลาเพื่อให้ฟ้าผ่าปรากฏไล่เลี่ยกัน
    return delays;
  }

  _LightningBoltData _generateBolt(int delay) {
    final screenWidth = _screenSize.width;
    final screenHeight = _screenSize.height;
    List<Offset> points = [];
    final boltLengthFactor = _random.nextDouble() * 0.7 + 0.3;

    double startX =
        _random.nextDouble() * screenWidth * 0.6 + screenWidth * 0.2;
    double startY = _random.nextDouble() * screenHeight * 0.3;

    points.add(Offset(startX, startY));
    double currentX = startX;
    double currentY = startY;

    while (currentY < screenHeight * boltLengthFactor) {
      double nextX = currentX + _random.nextDouble() * 80 - 40;
      double nextY = currentY + _random.nextDouble() * 100 + 20;

      nextX = nextX.clamp(0, screenWidth);
      nextY = nextY.clamp(0, screenHeight);

      points.add(Offset(nextX, nextY));

      if (_random.nextDouble() < 0.3 && points.length > 1) {
        _generateBranch(currentX, currentY, points);
      }

      currentX = nextX;
      currentY = nextY;
    }
    return _LightningBoltData(
      points: points,
      delay: Duration(milliseconds: delay),
    );
  }

  void _generateBranch(double startX, double startY, List<Offset> mainPoints) {
    final screenWidth = _screenSize.width;
    final screenHeight = _screenSize.height;
    double currentX = startX;
    double currentY = startY;
    int segments = _random.nextInt(4) + 2;
    List<Offset> branchPoints = [Offset(currentX, currentY)];
    final branchLengthFactor = _random.nextDouble() * 0.6 + 0.2;

    for (int i = 0; i < segments; i++) {
      double nextX = currentX + _random.nextDouble() * 50 - 25;
      double nextY = currentY + _random.nextDouble() * 60 + 10;

      nextX = nextX.clamp(0, screenWidth);
      nextY = nextY.clamp(0, screenHeight * branchLengthFactor);

      branchPoints.add(Offset(nextX, nextY));
      currentX = nextX;
      currentY = nextY;
    }
    _drawBranch(branchPoints, mainPoints);
  }

  void _drawBranch(List<Offset> points, List<Offset> mainPoints) {
    if (points.length < 2) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && mainPoints.isNotEmpty) {
        setState(() {
          final startIndex = mainPoints.indexOf(points.first);
          if (startIndex != -1) {
            mainPoints.insertAll(startIndex + 1, points.sublist(1));
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _MultipleLightningPainter(
          bolts: _bolts,
          color: widget.color,
          animationProgress: _animation.value,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _LightningBoltData {
  final List<Offset> points;
  final Duration delay;
  double startTime = -1.0;

  _LightningBoltData({required this.points, required this.delay});
}

class _MultipleLightningPainter extends CustomPainter {
  final List<_LightningBoltData> bolts;
  final Color color;
  final double animationProgress;
  final double fadeOutDuration = 0.35;

  _MultipleLightningPainter({
    required this.bolts,
    required this.color,
    required this.animationProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color.withOpacity(0.2)
          ..strokeWidth = 4.0
          ..strokeCap = StrokeCap.round;

    for (final bolt in bolts) {
      final double normalizedDelay = bolt.delay.inMilliseconds / 1000;
      final double startTime = normalizedDelay / 1.0;
      final double fadeInProgress = Curves.easeOut.transform(
        (animationProgress - startTime).clamp(0.0, 1.0),
      );

      if (bolt.startTime == -1.0 && fadeInProgress > 0.0) {
        bolt.startTime = animationProgress;
      }

      double boltOpacity = 0.0;
      if (bolt.startTime != -1.0) {
        final double elapsedTime = animationProgress - bolt.startTime;
        if (elapsedTime < fadeOutDuration) {
          boltOpacity = 0.2 * fadeInProgress.clamp(0.0, 1.0);
        } else {
          final double fadeOutProgress = ((elapsedTime - fadeOutDuration) / 0.2)
              .clamp(0.0, 1.0);
          boltOpacity =
              0.2 *
              (1.0 - Curves.easeIn.transform(fadeOutProgress)).clamp(0.0, 1.0);
        }
      } else {
        boltOpacity = 0.2 * fadeInProgress.clamp(0.0, 1.0);
      }

      final boltPaint =
          Paint()
            ..color = color.withOpacity(boltOpacity.clamp(0.0, 1.0))
            ..strokeWidth = 4.0
            ..strokeCap = StrokeCap.round;

      if (bolt.points.length < 2) continue;
      for (int i = 0; i < bolt.points.length - 1; i++) {
        canvas.drawLine(bolt.points[i], bolt.points[i + 1], boltPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_MultipleLightningPainter oldDelegate) {
    return oldDelegate.bolts != bolts ||
        oldDelegate.color != color ||
        oldDelegate.animationProgress != animationProgress;
  }
}
