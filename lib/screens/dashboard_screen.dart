import 'package:flutter/material.dart';
import 'package:autism_app/screens/task_list_screen.dart';
import 'package:autism_app/screens/game_screen.dart';
import 'package:autism_app/screens/communication/aac_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TaskListScreen()));
              },
              child: Text("📋 Task List"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
              },
              child: Text("🎮 Play Games"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AACScreen()));
              },
              child: Text("🗣 AAC Communication"),
            ),
            

          ],
        ),
      ),
    );
  }
}
