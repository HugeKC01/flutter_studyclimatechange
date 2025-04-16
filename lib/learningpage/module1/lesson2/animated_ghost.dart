import 'package:flutter/material.dart';

class AnimatedGhost extends StatefulWidget {
  final Rect startRect;
  final Rect endRect;
  final String imgPath;

  const AnimatedGhost({
    Key? key,
    required this.startRect,
    required this.endRect,
    required this.imgPath,
  }) : super(key: key);

  @override
  State<AnimatedGhost> createState() => _AnimatedGhostState();
}

class _AnimatedGhostState extends State<AnimatedGhost>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _top;
  late Animation<double> _left;
  late Animation<double> _width;
  late Animation<double> _height;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    _top = Tween<double>(
      begin: widget.startRect.top,
      end: widget.endRect.top + widget.endRect.height / 2,
    ).animate(_controller);

    _left = Tween<double>(
      begin: widget.startRect.left,
      end: widget.endRect.left + widget.endRect.width / 2,
    ).animate(_controller);

    _width = Tween<double>(
      begin: widget.startRect.width,
      end: 0,
    ).animate(_controller);

    _height = Tween<double>(
      begin: widget.startRect.height,
      end: 0,
    ).animate(_controller);

    _fade = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned(
          top: _top.value,
          left: _left.value,
          child: Opacity(
            opacity: _fade.value,
            child: Image.asset(
              widget.imgPath,
              width: _width.value,
              height: _height.value,
            ),
          ),
        );
      },
    );
  }
}
