import 'package:flutter/material.dart';
import 'minigame/cloth.dart';
import 'minigame/quiz.dart';
import 'minigame/cardgame.dart';
import 'minigame/wordgame.dart';
import 'minigame/drag_and_drop_game/difficulty_select_page.dart';
import '../component/adaptivenavigation.dart';
import 'minigame/ShootingGame.dart';
import 'minigame/BasketGame.dart';

class MinigameScreen extends StatelessWidget {
  const MinigameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final minigames = [
      {
        'title': 'Module 1 - Rainy Day Packing',
        'subtitle': 'เตรียมตัวรับมือกับฝน',
        'description': 'เลือกสิ่งของที่จำเป็นสำหรับวันฝนตก',
        'cover': 'asset/module1/ImageFORGAME (2).PNG',
        'screen': Module1l2MiniGame(),
      },
      {
        'title': 'Module 1 - Quiz',
        'subtitle': 'ถามไวตอบเร็ว',
        'description': 'ตอบคำถามเกี่ยวกับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover': 'asset/default/testimage_.png',
        'screen': Module1l2Quiz(),
      },
      {
        'title': 'Module 3 - Word Match Game',
        'subtitle': 'จับคู่คำศัพท์',
        'description': 'จับคู่คำศัพท์ที่เกี่ยวข้องกับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover': 'asset/default/testimage_.png',
        'screen': WordMatchGamePage(),
      },
      {
        'title': 'Module 3 - Drag and Drop Game',
        'subtitle': 'ลากและวาง',
        'description': 'ลากและวางคำศัพท์ที่เกี่ยวข้องกับการเปลี่ยนแปลงสภาพภูมิอากาศ',
        'cover': 'asset/default/testimage_.png',
        'screen': const DifficultySelectPage(),
      },
      {
        'title': 'Shooting Game',
        'subtitle': 'Shooting Game',
        'description': 'เล่นเกมยิงปืนเพื่อทำคะแนน',
        'cover': 'asset/default/testimage_.png',
        'screen': const MyGamePage(),
      },
      {
        'title': 'BasketGame',
        'subtitle': 'My Game',
        'description': 'เล่นเกมยิงปืนเพื่อทำคะแนน',
        'cover': 'asset/default/testimage_.png',
        'screen': const BasketGame(),
      },
      {
        'title': 'Card Game',
        'subtitle': 'My Game',
        'description': 'เล่นเกมการ์ดเพื่อทำคะแนน',
        'cover': 'asset/default/testimage_.png',
        'screen': const CardGameApp(),
      },
      // Add more minigames here as needed
    ];

    return AdaptiveNavigation(
      title: 'Minigames',
      selectedIndex: 2,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 700 ? 1 : 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: minigames.length,
                itemBuilder: (context, index) {
                  final minigame = minigames[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => minigame['screen'] as Widget,
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5.0,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(minigame['cover'] as String),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                            title: Text(
                              minigame['title'] as String,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(minigame['subtitle'] as String),
                                Text(minigame['description'] as String),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
