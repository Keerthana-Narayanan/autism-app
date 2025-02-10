import 'dart:math';
import 'package:flutter/material.dart';

class MathQuizGame extends StatefulWidget {
  @override
  _MathQuizGameState createState() => _MathQuizGameState();
}

class _MathQuizGameState extends State<MathQuizGame> {
  int num1 = 0, num2 = 0, correctAnswer = 0;
  String operation = '+';
  List<int> options = [];
  int score = 0;
  
  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    Random random = Random();
    num1 = random.nextInt(10) + 1;
    num2 = random.nextInt(10) + 1;
    List<String> operations = ['+', '-', '*'];
    operation = operations[random.nextInt(3)];

    switch (operation) {
      case '+':
        correctAnswer = num1 + num2;
        break;
      case '-':
        correctAnswer = num1 - num2;
        break;
      case '*':
        correctAnswer = num1 * num2;
        break;
    }
    
    options = [correctAnswer];
    while (options.length < 4) {
      int wrongAnswer = correctAnswer + random.nextInt(10) - 5;
      if (wrongAnswer != correctAnswer && wrongAnswer >= 0) {
        options.add(wrongAnswer);
      }
    }
    options.shuffle();
    setState(() {});
  }

  void checkAnswer(int selectedAnswer) {
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct! 🎉'), duration: Duration(milliseconds: 500)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wrong! Try Again ❌'), duration: Duration(milliseconds: 500)));
    }
    generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Math Quiz Game 🧮')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$num1 $operation $num2 = ?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Wrap(
              spacing: 15,
              children: options.map((option) => ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text('$option', style: TextStyle(fontSize: 22)),
              )).toList(),
            ),
            SizedBox(height: 30),
            Text('Score: $score', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
