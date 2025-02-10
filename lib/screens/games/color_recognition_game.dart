import 'package:flutter/material.dart';

class ColorRecognitionGame extends StatefulWidget {
  @override
  _ColorRecognitionGameState createState() => _ColorRecognitionGameState();
}

class _ColorRecognitionGameState extends State<ColorRecognitionGame> {
  final List<Map<String, dynamic>> colors = [
    {"name": "Red", "color": Colors.red},
    {"name": "Blue", "color": Colors.blue},
    {"name": "Green", "color": Colors.green}
  ];

  int score = 0;
  String targetColor = "Red";

  void checkColor(String selectedColor) {
    if (selectedColor == targetColor) {
      setState(() {
        score += 1;
        targetColor = (colors..shuffle()).first["name"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🎨 Color Recognition Game")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Score: $score", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text("Select the color: $targetColor", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: colors.map((colorMap) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: colorMap["color"]),
                  onPressed: () {
                    checkColor(colorMap["name"]);
                  },
                  child: Text(" "),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
