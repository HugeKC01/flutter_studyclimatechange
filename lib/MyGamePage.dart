import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

// Bullet model
class Bullet {
  double x;
  double y;
  final double speed = 5.0;

  Bullet({required this.x, required this.y});

  void move() {
    y -= speed;
  }

  Rect getRect() => Rect.fromLTWH(x, y, 10, 20);
}

// Enemy model
class Enemy {
  double x;
  double y;
  double dx;
  final double speed = 1.0;
  final String image;

  Enemy({
    required this.x,
    required this.y,
    required this.dx,
    required this.image,
  });

  void move(double canvasWidth) {
    x += dx;
    y += speed;

    if (x <= 0 || x >= canvasWidth - 50) {
      dx = -dx;
    }
  }

  Rect getRect() => Rect.fromLTWH(x, y, 50, 50);
}

class MyGamePage extends StatefulWidget {
  const MyGamePage({Key? key}) : super(key: key);

  @override
  State<MyGamePage> createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {
  final double canvasHeight = 640;
  late double canvasWidth;

  double playerX = 0;
  double playerY = 0;
  final double playerSize = 60;

  List<Bullet> bullets = [];
  List<Enemy> enemies = [];

  bool movingLeft = false;
  bool movingRight = false;

  int score = 0;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    canvasWidth = canvasHeight * 9 / 16;
    playerX = canvasWidth / 2 - playerSize / 2;
    playerY = canvasHeight - 150;

    startGameLoop();
    Timer.periodic(const Duration(seconds: 2), (_) => spawnEnemy());
  }

  void startGameLoop() {
    Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!mounted) return;
      setState(() {
        // Move player
        if (movingLeft) playerX = playerX - 3;
        if (movingRight) playerX = playerX + 3;
        // Clamp playerX to stay within bounds
        playerX = playerX.clamp(0, canvasWidth - playerSize);

        // Move bullets
        bullets.forEach((b) => b.move());
        bullets.removeWhere((b) => b.y < -20);

        // Move enemies
        enemies.forEach((e) => e.move(canvasWidth));

        // Check collisions and update score
        bullets.removeWhere((bullet) {
          bool hit = false;
          enemies.removeWhere((enemy) {
            if (bullet.getRect().overlaps(enemy.getRect())) {
              hit = true;

              if (enemy.image.contains('enamy1') ||
                  enemy.image.contains('enamy2') ||
                  enemy.image.contains('enamy3')) {
                score++;
              } else if (enemy.image.contains('enamy4') ||
                         enemy.image.contains('enamy5')) {
                score = max(0, score - 1);
              }

              return true;
            }
            return false;
          });
          return hit;
        });
      });
    });
  }

  void spawnEnemy() {
    if (!mounted) return;
    double x = random.nextDouble() * (canvasWidth - 50);
    double dx = random.nextBool() ? 1.0 : -1.0;
    int imageIndex = random.nextInt(5) + 1;
    String image = 'asset/yu/enamy$imageIndex.png';

    setState(() {
      enemies.add(Enemy(x: x, y: 0, dx: dx, image: image));
    });
  }

  void fireBullet() {
    bullets.add(Bullet(x: playerX + playerSize / 2 - 5, y: playerY));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Game Page')),
      body: Listener(
        onPointerUp: (_) {
          if (mounted) setState(() {
            movingLeft = false;
            movingRight = false;
          });
        },
        onPointerCancel: (_) {
          if (mounted) setState(() {
            movingLeft = false;
            movingRight = false;
          });
        },
        child: Center(
          child: Container(
            width: canvasWidth,
            height: canvasHeight,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Stack(
              children: [
                // Score Text
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Score: $score',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Player
                Positioned(
                  left: playerX,
                  top: playerY,
                  child: Image.asset('asset/yu/mychar.png', width: playerSize, height: playerSize),
                ),

                // Bullets
                ...bullets.map((b) => Positioned(
                      left: b.x,
                      top: b.y,
                      child: Image.asset('asset/yu/bullet.png', width: 10, height: 20),
                    )),

                // Enemies
                ...enemies.map((e) => Positioned(
                      left: e.x,
                      top: e.y,
                      child: Image.asset(e.image, width: 50, height: 50),
                    )),

                // Left Button
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: GestureDetector(
                    onTapDown: (_) {
                      if (mounted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) setState(() => movingLeft = true);
                        });
                      }
                    },
                    onTapUp: (_) {
                      if (mounted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) setState(() => movingLeft = false);
                        });
                      }
                    },
                    onTapCancel: () {
                      if (mounted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) setState(() => movingLeft = false);
                        });
                      }
                    },
                    child: Image.asset('asset/yu/leftButton.png', width: 60),
                  ),
                ),

                // Right Button
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTapDown: (_) {
                      if (mounted) setState(() => movingRight = true);
                    },
                    onTapUp: (_) {
                      if (mounted) setState(() => movingRight = false);
                    },
                    onTapCancel: () {
                      if (mounted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) setState(() => movingRight = false);
                        });
                      }
                    },
                    child: Image.asset('asset/yu/rightButton.png', width: 60),
                  ),
                ),

                // Fire Button
                Positioned(
                  bottom: 10,
                  left: (canvasWidth - 60) / 2,
                  child: GestureDetector(
                    onTap: () {
                      if (mounted) {
                        fireBullet();
                      }
                    },
                    child: Image.asset('asset/yu/fireButton.png', width: 60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
