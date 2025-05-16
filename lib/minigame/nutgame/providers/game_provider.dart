import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../utils/constants.dart';

class GameProvider extends ChangeNotifier {
  static const int maxCards = 10; // Maximum cards player can hold

  final List<CardModel> _playerCards = [];
  int _currentEnemyIndex = 0;
  final List<int> _enemyHealths = [15, 20, 25];

  bool _isGameOver = false;
  bool _didPlayerWin = false;
  bool _outOfCards = false;

  List<CardModel> get playerCards => _playerCards;
  int get totalValue => _playerCards.fold(0, (sum, card) => sum + card.value);
  int get currentEnemyHealth => _enemyHealths[_currentEnemyIndex];
  int get currentEnemyIndex => _currentEnemyIndex;
  bool get isGameOver => _isGameOver;
  bool get didPlayerWin => _didPlayerWin;
  bool get outOfCards => _outOfCards;

  void drawCard() {
    if (_isGameOver || _outOfCards) return;

    if (_playerCards.length >= maxCards) {
      _outOfCards = true;
      _isGameOver = true;
      _didPlayerWin = false;
      notifyListeners();
      return;
    }

    final newCard = climateCards[_playerCards.length % climateCards.length];
    _playerCards.add(newCard);

    // Check again after drawing if we've hit the limit
    if (_playerCards.length >= maxCards) {
      _outOfCards = true;
    }

    notifyListeners();
  }

  void attackEnemy() {
    if (_isGameOver) return;

    // Can't attack with no cards
    if (_playerCards.isEmpty) {
      _isGameOver = true;
      _didPlayerWin = false;
      notifyListeners();
      return;
    }

    if (totalValue > currentEnemyHealth) {
      _currentEnemyIndex++;
      _playerCards.clear();
      _outOfCards = false; // Reset out of cards for next enemy

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
    _outOfCards = false;
    _enemyHealths[0] = 15;
    _enemyHealths[1] = 20;
    _enemyHealths[2] = 25;
    _enemyHealths.shuffle();
    notifyListeners();
  }
}
