import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AACScreen extends StatefulWidget {
  @override
  _AACScreenState createState() => _AACScreenState();
}

class _AACScreenState extends State<AACScreen> {
  FlutterTts flutterTts = FlutterTts();
  List<String> sentence = [];

  final List<Map<String, String>> symbols = [
    {'text': 'Hello', 'image': 'assets/images/hello.png'},
    {'text': 'Yes', 'image': 'assets/images/yes.png'},
    {'text': 'No', 'image': 'assets/images/no.png'},
    {'text': 'Eat', 'image': 'assets/images/eat.png'},
    {'text': 'Drink', 'image': 'assets/images/drink.png'},
    {'text': 'Help', 'image': 'assets/images/help.png'},
  ];

  void addToSentence(String word) {
    setState(() {
      sentence.add(word);
    });
  }

  void speakSentence() async {
    if (sentence.isNotEmpty) {
      await flutterTts.speak(sentence.join(" "));
    }
  }

  void clearSentence() {
    setState(() {
      sentence.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AAC Communication")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            height: 80,
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: sentence.map((word) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(label: Text(word)),
                      )).toList(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: clearSentence,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: symbols.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => addToSentence(symbols[index]['text']!),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(symbols[index]['image']!, height: 60),
                        SizedBox(height: 8),
                        Text(symbols[index]['text']!, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: speakSentence,
              child: Text("🔊 Speak"),
            ),
          ),
        ],
      ),
    );
  }
}
