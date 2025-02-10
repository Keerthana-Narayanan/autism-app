// import 'package:flutter/material.dart';

// class TestScreen extends StatelessWidget {
//   final List<String> dummyData = ['Alice', 'Bob', 'Charlie'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Test Data')),
//       body: ListView.builder(
//         itemCount: dummyData.length,
//         itemBuilder: (context, index) {
//           return ListTile(title: Text(dummyData[index]));
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class TestScreen extends StatelessWidget {
//   // Dummy data for testing
//   final List<String> dummyData = const['Alice', 'Bob', 'Charlie'];

//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Test Data')),
//       body: ListView.builder(
//         itemCount: dummyData.length,
//         itemBuilder: (context, index) {
//           return ListTile(title: Text(dummyData[index]));
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/some_widget.dart';

class TestScreen extends StatelessWidget {
  final List<String> dummyData = ['Alice', 'Bob', 'Charlie']; // ✅ Add 'const'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SomeWidget(data: dummyData), // ✅ Works because dummyData is 'const'
          ],
        ),
      ),
    );
  }
}
