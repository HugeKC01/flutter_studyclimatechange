import 'dart:async';
import 'package:flutter/material.dart';
import 'package:climatechange/main.dart';

// Remove the main() function from this file!
// This widget will be shown by main.dart as the first screen.

class OpenScene extends StatefulWidget {
  const OpenScene({super.key});

  @override
  State<OpenScene> createState() => _OpenSceneState();
}

class _OpenSceneState extends State<OpenScene> {
  List<List<Color>> gradientColors = [
    [Colors.blue, Colors.purple],
    [Colors.orange, Colors.red],
    [Colors.green, Colors.teal],
  ];
  int index = 0;
  bool isPressed = false;
  double globeScale = 1.0;
  bool fadeToSecond = false;
  Timer? _bgTimer;

  @override
  void initState() {
    super.initState();
    _bgTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!isPressed) {
        setState(() {
          index = (index + 1) % gradientColors.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _bgTimer?.cancel();
    super.dispose();
  }

  void _onButtonPressed() {
    if (isPressed) return;

    setState(() {
      isPressed = true;
    });

    Timer.periodic(const Duration(milliseconds: 25), (timer) {
      setState(() {
        globeScale -= 0.05;
        if (globeScale <= 0) {
          globeScale = 0;
          timer.cancel();
          fadeToSecond = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final globeSize = screenWidth * 0.15;
    final scaledGlobeScale = isPressed ? globeScale : 1.0;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors[index],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Content column: globe and text (without button)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: scaledGlobeScale,
                  child: Image.asset(
                    'asset/overall/icon.png',
                    width: globeSize,
                    height: globeSize,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Welcome to Interactive E-Book',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),

          // Start button always on top
          Align(
            alignment: const Alignment(0, 0.5),
            child: ElevatedButton(
              onPressed: _onButtonPressed,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Start', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),

          // Fade transition overlay with IgnorePointer
          IgnorePointer(
            ignoring: !fadeToSecond,
            child: AnimatedOpacity(
              opacity: fadeToSecond ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              onEnd: () {
                if (fadeToSecond) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const MyApp()),
                  );
                }
              },
              child: Container(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

