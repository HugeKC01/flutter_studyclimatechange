import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../utils/constants.dart';

class GameProvider extends ChangeNotifier {
  final List<CardModel> _playerCards = [];
  int _currentEnemyIndex = 0;
  final List<int> _enemyHealths = [15, 20, 25];

  bool _isGameOver = false;
  bool _didPlayerWin = false;

  List<CardModel> get playerCards => _playerCards;
  int get totalValue =>
      _playerCards.fold(0, (sum, card) => sum + card.value);
  int get currentEnemyHealth => _enemyHealths[_currentEnemyIndex];
  int get currentEnemyIndex => _currentEnemyIndex;
  bool get isGameOver => _isGameOver;
  bool get didPlayerWin => _didPlayerWin;

  void drawCard() {
    if (_isGameOver) return;

    final newCard = climateCards[_playerCards.length % climateCards.length];
    _playerCards.add(newCard);
    notifyListeners();
  }

  void attackEnemy() {
    if (_isGameOver) return;

    if (totalValue > currentEnemyHealth) {
      _currentEnemyIndex++;
      _playerCards.clear();

      if (_currentEnemyIndex >= _enemyHealths.length) {
        _didPlayerWin = true;
        _isGameOver = true;
      }
    } else {
      _isGameOver = true;
      _didPlayerWin = false;
    }

    notifyListeners();
  }

  void resetGame() {
    _playerCards.clear();
    _currentEnemyIndex = 0;
    _isGameOver = false;
    _didPlayerWin = false;
    _enemyHealths[0] = 15;
    _enemyHealths[1] = 20;
    _enemyHealths[2] = 25;
    _enemyHealths.shuffle();
    notifyListeners();
  }
}
