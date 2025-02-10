// import 'package:flutter/material.dart';

// class GameScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("🎮 Play Games")),
//       body: Center(
//         child: Text(
//           "Welcome to the Game Section!",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

 // Import the color recognition game file


import 'package:flutter/material.dart';
import 'games/math_quiz_game.dart';
import 'games/word_matching_game.dart';
import 'games/color_recognition_game.dart';


class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;

  void increaseScore() {
    setState(() {
      score += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🎮 Play Games")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Score: $score", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),

            // 🧮 Math Quiz Game Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MathQuizGame()),
                );
              },
              child: Text('🧮 Play Math Quiz'),
            ),

            SizedBox(height: 10), // Add space between buttons

            // 📝 Word Matching Game Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordMatchingGame()),
                );
              },
              child: Text('📝 Play Word Matching'),
            ),

            SizedBox(height: 10),

            // 🎨 Color Recognition Game Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorRecognitionGame()),
                );
              },
              child: Text('🎨 Play Color Recognition'),
            ),
          ],
        ),
      ),
    );
  }
}
