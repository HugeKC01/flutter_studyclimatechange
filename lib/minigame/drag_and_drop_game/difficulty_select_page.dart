import 'package:flutter/material.dart';
import 'drag_and_drop_game.dart';

class DifficultySelectPage extends StatefulWidget {
  const DifficultySelectPage({Key? key}) : super(key: key);

  @override
  State<DifficultySelectPage> createState() => _DifficultySelectPageState();
}

class _DifficultySelectPageState extends State<DifficultySelectPage> {
  String difficultyLevel = 'normal';
  bool challengeMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เลือกความยากและโหมดเกม')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('เลือกระดับความยาก', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                DropdownButton<String>(
                  value: difficultyLevel,
                  items: const [
                    DropdownMenuItem(value: 'easy', child: Text('ง่าย')),
                    DropdownMenuItem(value: 'normal', child: Text('ปานกลาง')),
                    DropdownMenuItem(value: 'hard', child: Text('ยาก')),
                  ],
                  onChanged: (val) {
                    if (val != null) setState(() => difficultyLevel = val);
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('โหมดปกติ'),
                    Switch(
                      value: challengeMode,
                      onChanged: (val) => setState(() => challengeMode = val),
                    ),
                    const Text('โหมดท้าทาย'),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordArrangeGame(
                          difficultyLevel: difficultyLevel,
                          challengeMode: challengeMode,
                        ),
                      ),
                    );
                  },
                  child: const Text('เริ่มเกม'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
