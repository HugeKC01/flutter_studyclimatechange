import 'package:flutter/material.dart';
import 'nutgame/screens/home_screen.dart';
import 'nutgame/screens/game_screen.dart';
import 'nutgame/screens/result_screen.dart';
import 'nutgame/providers/game_provider.dart';
import 'package:provider/provider.dart';


class CardGameApp extends StatelessWidget {
  const CardGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: MaterialApp(
        title: 'Climate Card Game',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'default',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/game': (context) => const GameScreen(),
          '/result': (context) => ResultScreen(
            didPlayerWin: true,
            onExit: () {
              Navigator.of(context).pop();
            },
          ),
                  },
      ),
    );
  }
}