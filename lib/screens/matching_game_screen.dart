import 'package:flutter/material.dart';

class MatchingGameScreen extends StatefulWidget {
  @override
  _MatchingGameScreenState createState() => _MatchingGameScreenState();
}

class _MatchingGameScreenState extends State<MatchingGameScreen> {
  Map<String, String> pairs = {
    '🍎': 'Apple',
    '🐶': 'Dog',
    '🚗': 'Car'
  };

  Map<String, bool> matched = {};
  int score = 0;
  int timeLeft = 30;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted && timeLeft > 0 && !gameOver) {
        setState(() {
          timeLeft--;
        });
        _startTimer();
      } else if (timeLeft == 0) {
        _showGameOverDialog();
      }
    });
  }

  void _checkWin() {
    if (matched.length == pairs.length) {
      setState(() {
        gameOver = true;
      });
      _showWinDialog();
    }
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('🎉 You Win!'),
        content: Text('Score: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetGame();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('⏳ Time Up!'),
        content: Text('Final Score: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetGame();
            },
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    setState(() {
      matched.clear();
      score = 0;
      timeLeft = 30;
      gameOver = false;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Matching Game')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Score: $score', style: TextStyle(fontSize: 20)),
                Text('Time Left: $timeLeft sec', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: pairs.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  child: matched[emoji] == true
                      ? Container()
                      : Text(emoji, style: TextStyle(fontSize: 40)),
                  feedback: Text(emoji, style: TextStyle(fontSize: 40)),
                  childWhenDragging: Container(),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Column(
              children: pairs.entries.map((entry) {
                return DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 200,
                      height: 50,
                      color: matched[entry.key] == true
                          ? Colors.green
                          : Colors.grey.shade300,
                      child: Center(child: Text(entry.value)),
                    );
                  },
                  onAccept: (data) {
                    if (data == entry.key) {
                      setState(() {
                        matched[data] = true;
                        score += 10; // Increase score for correct match
                      });
                      _checkWin();
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
