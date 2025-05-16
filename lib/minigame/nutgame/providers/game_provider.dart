import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../utils/constants.dart';
import 'dart:math'; // Import ไลบรารีสำหรับ Random

class GameProvider extends ChangeNotifier {
  final List<CardModel> _playerCards = [];
  int _currentEnemyIndex = 0;
  List<int> _enemyHealths = [15, 20, 25];
  final int _maxEnemies = 100; // กำหนดจำนวนศัตรูสูงสุด
  List<int> _allEnemyHealths = []; // รายชื่อพลังชีวิตของศัตรูทั้งหมด
  final Random random = Random(); // สร้าง instance ของ Random

  bool _isGameOver = false;
  bool _didPlayerWin = false;

  GameProvider() {
    _generateEnemyHealths(); // สร้างพลังชีวิตศัตรูเมื่อ Provider ถูกสร้าง
  }

  List<CardModel> get playerCards => _playerCards;
  int get totalValue => _playerCards.fold(0, (sum, card) => sum + card.value);
  int get currentEnemyHealth {
    if (_currentEnemyIndex < 0 || _currentEnemyIndex >= _allEnemyHealths.length) {
      return 0;
    }
    return _allEnemyHealths[_currentEnemyIndex];
  }
  int get currentEnemyIndex => _currentEnemyIndex;
  bool get isGameOver => _isGameOver;
  bool get didPlayerWin => _didPlayerWin;
  int get enemiesLength => _allEnemyHealths.length; // Getter สำหรับจำนวนศัตรู

  void _generateEnemyHealths() {
    _allEnemyHealths = List.generate(_maxEnemies, (index) {
      // กำหนดช่วงพลังชีวิตศัตรูแบบสุ่ม หรือตามที่คุณต้องการ
      return 10 + (index * 2) + (random.nextInt(10));
    });
    // สุ่มลำดับพลังชีวิตศัตรู
    _allEnemyHealths.shuffle();
  }

  void drawCard() {
    if (_isGameOver) return;

    final newCard = climateCards[_playerCards.length % climateCards.length];
    _playerCards.add(newCard);
    notifyListeners();
  }

  void attackEnemy() {
    if (_isGameOver) return;

    if (totalValue > currentEnemyHealth) {
      // ผู้เล่นโจมตีสำเร็จ
      _playerCards.clear();
      _currentEnemyIndex++;

      if (_currentEnemyIndex >= _allEnemyHealths.length) {
        // ผู้เล่นชนะศัตรูทั้งหมด
        _didPlayerWin = true;
        _isGameOver = true;
      }
    } else {
      // ผู้เล่นโจมตีไม่สำเร็จ (แพ้)
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
    _generateEnemyHealths(); // สร้างพลังชีวิตศัตรูใหม่เมื่อรีเซ็ตเกม
    notifyListeners();
  }
}