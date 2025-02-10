import 'dart:async';
import 'package:flutter/material.dart';

class GameService extends ChangeNotifier {
  final Map<String, String> _pairs = {
    '🍎': 'Apple',
    '🐶': 'Dog',
    '🚗': 'Car'
  };

  Map<String, bool> _matched = {};
  int _score = 0;
  int _timeLeft = 30;
  bool _gameOver = false;
  Timer? _timer;

  Map<String, String> get pairs => _pairs;
  Map<String, bool> get matched => _matched;
  int get score => _score;
  int get timeLeft => _timeLeft;
  bool get gameOver => _gameOver;

  void startGame() {
    _resetGame();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0 && !_gameOver) {
        _timeLeft--;
        notifyListeners();
      } else {
        _gameOver = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void checkMatch(String emoji, String word) {
    if (_pairs[emoji] == word) {
      _matched[emoji] = true;
      _score += 10;
      notifyListeners();

      if (_matched.length == _pairs.length) {
        _gameOver = true;
        _timer?.cancel();
        notifyListeners();
      }
    }
  }

  void resetGame() {
    _resetGame();
    _startTimer();
  }

  void _resetGame() {
    _matched.clear();
    _score = 0;
    _timeLeft = 30;
    _gameOver = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
