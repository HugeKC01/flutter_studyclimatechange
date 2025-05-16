import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;

  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(
              card.imageAsset,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              card.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text('Value: ${card.value}'),
          ],
        ),
      ),
    );
  }
}
