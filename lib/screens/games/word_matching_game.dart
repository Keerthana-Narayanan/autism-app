// import 'package:flutter/material.dart';

// class WordMatchingGame extends StatefulWidget {
//   @override
//   _WordMatchingGameState createState() => _WordMatchingGameState();
// }

// class _WordMatchingGameState extends State<WordMatchingGame> {
//   final Map<String, String> words = {
//     "Apple": "A fruit",
//     "Elephant": "A large animal",
//     "Sun": "Shines in the sky"
//   };

//   String? selectedWord;
//   String? selectedMeaning;
//   int score = 0;

//   void checkMatch() {
//     if (selectedWord != null && selectedMeaning != null) {
//       if (words[selectedWord] == selectedMeaning) {
//         setState(() {
//           score += 1;
//         });
//       }
//       setState(() {
//         selectedWord = null;
//         selectedMeaning = null;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("📝 Word Matching Game")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Score: $score", style: TextStyle(fontSize: 24)),
//             SizedBox(height: 20),
//             Wrap(
//               spacing: 10,
//               children: words.keys.map((word) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedWord = word;
//                     });
//                     checkMatch();
//                   },
//                   child: Text(word),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             Wrap(
//               spacing: 10,
//               children: words.values.map((meaning) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedMeaning = meaning;
//                     });
//                     checkMatch();
//                   },
//                   child: Text(meaning),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class WordMatchingGame extends StatefulWidget {
  @override
  _WordMatchingGameState createState() => _WordMatchingGameState();
}

class _WordMatchingGameState extends State<WordMatchingGame> {
  Map<String, String> wordPairs = {
    "Apple": "🍎",
    "Sun": "☀️",
    "Book": "📖",
    "Car": "🚗",
  };

  List<String> words = [];
  List<String> meanings = [];

  String? selectedWord;
  String? selectedMeaning;

  @override
  void initState() {
    super.initState();
    words = wordPairs.keys.toList()..shuffle();
    meanings = wordPairs.values.toList()..shuffle();
  }

  void checkMatch(String word, String meaning) {
    if (wordPairs[word] == meaning) {
      setState(() {
        words.remove(word);
        meanings.remove(meaning);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("✅ Correct Match!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌ Wrong Match! Try Again."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
    }

    setState(() {
      selectedWord = null;
      selectedMeaning = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📝 Word Matching Game")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Match the words with their meanings!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Word Column
                  Column(
                    children: words.map((word) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedWord = word;
                            if (selectedMeaning != null) {
                              checkMatch(selectedWord!, selectedMeaning!);
                            }
                          });
                        },
                        child: Text(word, style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedWord == word ? Colors.blue : Colors.grey,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        ),
                      );
                    }).toList(),
                  ),
                  // Meaning Column
                  Column(
                    children: meanings.map((meaning) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedMeaning = meaning;
                            if (selectedWord != null) {
                              checkMatch(selectedWord!, selectedMeaning!);
                            }
                          });
                        },
                        child: Text(meaning, style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedMeaning == meaning ? Colors.blue : Colors.grey,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
