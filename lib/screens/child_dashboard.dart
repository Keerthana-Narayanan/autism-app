// import 'package:flutter/material.dart';
// import 'game_screen.dart'; // Import the game feature
// import 'package:autism_app/screens/communication/aac_screen.dart'; // Import the AAC Screen

// class ChildDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Child Dashboard")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Welcome to the Child Dashboard"),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GameScreen()), // Navigate to Game Screen
//               );
//             },
//             child: Text("🎮 Play Game"),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AACScreen()), // Navigate to AAC Screen
//               );
//             },
//             child: Text("🗣 AAC Communication"),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'package:autism_app/screens/communication/aac_screen.dart';

class ChildDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Child Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/games");
              },
              child: Text("Games"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/aac");
              },
              child: Text("AAC Communication"),
            ),
          ],
        ),
      ),
    );
  }
}
