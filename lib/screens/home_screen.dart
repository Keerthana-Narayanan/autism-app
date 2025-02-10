// import 'package:flutter/material.dart';
// import 'features_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Welcome to Autism Development App', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => FeaturesScreen()));
//               },
//               style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               child: Text('Get Started'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'login_screen.dart';

// class HomeScreen extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await _authService.signOut();
//             Navigator.pop(context);
//           },
//           child: Text('Logout'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'login_screen.dart';

// class HomeScreen extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await _authService.signOut();  // Logs the user out
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => LoginScreen()), // Ensures navigation to login
//             );
//           },
//           child: Text('Logout'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'auth_screen.dart';

// class HomeScreen extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   void logout(BuildContext context) {
//     _authService.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => AuthScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => logout(context),
//           ),
//         ],
//       ),
//       body: Center(child: Text("Welcome to Autism Development App!")),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import '../widgets/speech_widget.dart';
// import '../widgets/loading_widget.dart';
// import 'auth_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final AuthService _authService = AuthService();
//   String detectedEmotion = "Neutral"; // Default emotion

//   void logout(BuildContext context) {
//     _authService.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => AuthScreen()),
//     );
//   }

//   void updateEmotion(String emotion) {
//     setState(() {
//       detectedEmotion = emotion;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Autism Development App"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => logout(context),
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Welcome!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//           SizedBox(height: 20),

//           // Speech Recognition Widget
//           SpeechWidget(),

//           SizedBox(height: 20),

//           // Emotion Recognition Widget
//           EmotionWidget(emotion: detectedEmotion),

//           SizedBox(height: 20),

//           // Emotion Detection Button
//           ElevatedButton(
//             onPressed: () {
//               updateEmotion("Happy"); // Simulate emotion detection
//             },
//             child: Text("Detect Emotion"),
//           ),

//           SizedBox(height: 20),

//           // Loading animation for background processing
//           LoadingWidget(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autism Development App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavButton(context, "Dashboard", "/dashboard"),
            _buildNavButton(context, "Child Dashboard", "/child_dashboard"),
            _buildNavButton(context, "Tasks", "/tasks"),
            _buildNavButton(context, "Games", "/games"),
            _buildNavButton(context, "AAC Communication", "/aac"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
