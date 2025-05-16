import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/card.dart';
import '../widgets/enemy.dart';
import '../widgets/score.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, _) {
        if (gameProvider.isGameOver) {
          // Navigate to result screen and reset game state on replay
          Future.microtask(() async {
            final replay = await Navigator.pushReplacementNamed(
              context,
              '/result',
              arguments: gameProvider.didPlayerWin,
            );

            if (replay == true) {
              gameProvider.resetGame();
            }
          });
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Battle Time!')),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                EnemyWidget(
                  enemyIndex: gameProvider.currentEnemyIndex,
                  health: gameProvider.currentEnemyHealth,
                ),
                const SizedBox(height: 20),

                // Player Cards
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gameProvider.playerCards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: CardWidget(card: gameProvider.playerCards[index]),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                ScoreWidget(score: gameProvider.totalValue),
                const Spacer(),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: gameProvider.drawCard,
                      icon: const Icon(Icons.add),
                      label: const Text('Draw Card'),
                    ),
                    ElevatedButton.icon(
                      onPressed: gameProvider.attackEnemy,
                      icon: const Icon(Icons.flash_on),
                      label: const Text('Attack'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}