// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'screens/home_screen.dart';
// import 'screens/test_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(AutismApp());
// }

// class AutismApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Autism Development App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//   appBar: AppBar(title: Text('Autism App')),
//   body: Center(child: Text('Hello, World!')),
// ),

//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'screens/test_screen.dart'; // Correct import for the test screen
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // Initialize Firebase
//   runApp(AutismApp());
// }

// class AutismApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Removes debug banner
//       title: 'Autism Development App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: TestScreen(), // Navigates to TestScreen
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; // Import Firebase options
// import 'screens/task_list_screen.dart';
// import 'screens/matching_game_screen.dart';
// import 'screens/auth_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/home_screen.dart';
// import 'package:autism_app/screens/dashboard_screen.dart';  ✅ Correct Import

// import 'screens/task_list_screen.dart';
// import 'screens/game_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Firebase with options
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const AutismApp());
// }

// class AutismApp extends StatelessWidget {
//   const AutismApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Autism Development App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       //home: AuthScreen(), // // This decides if user goes to login or home
//       initialRoute: "/dashboard",
//       routes: {
//         "/login": (context) => LoginScreen(),
//         "/home": (context) => HomeScreen(),
//         "/tasks": (context) => TaskListScreen(),
//         "/matching-game": (context) => MatchingGameScreen(),
//         "/games": (context) => GameScreen(),
//       },
//     );
//   }
// }

//

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'firebase_options.dart';

// // Screens
// import 'package:autism_app/screens/dashboard_screen.dart';
// import 'package:autism_app/screens/task_list_screen.dart';
// import 'package:autism_app/screens/game_screen.dart';
// import 'package:autism_app/screens/auth_screen.dart';
// import 'package:autism_app/screens/child_dashboard.dart';
// import 'package:autism_app/screens/login_screen.dart';
// import 'package:autism_app/screens/home_screen.dart';

// // Services
// import 'package:autism_app/services/auth_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(AutismApp());
// }

// class AutismApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Autism Development App',
//       home: AuthCheck(),  // Decides if user goes to login or home
//       routes: {
//         "/home": (context) => HomeScreen(),
//         "/login": (context) => LoginScreen(),

//         "/dashboard": (context) => DashboardScreen(),
//         "/child_dashboard": (context) => ChildDashboard(),
//         "/tasks": (context) => TaskListScreen(),
//         "/games": (context) => GameScreen(),

//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }

// // Automatically checks if user is logged in and redirects accordingly
// class AuthCheck extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String?>(
//       future: _authService.getUserRole(),  // Fetch user role
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(body: Center(child: CircularProgressIndicator()));
//         } else if (snapshot.hasData && snapshot.data != null) {
//           String role = snapshot.data!;
//           if (role == "parent") {
//             return DashboardScreen();
//           } else if (role == "child") {
//             return ChildDashboard();
//           } else {
//             return HomeScreen(); // Default fallback
//           }
//         } else {
//           return LoginScreen();
//         }
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'firebase_options.dart';

// // Screens
// import 'package:autism_app/screens/dashboard_screen.dart';
// import 'package:autism_app/screens/task_list_screen.dart';
// import 'package:autism_app/screens/game_screen.dart';
// import 'package:autism_app/screens/auth_screen.dart';
// import 'package:autism_app/screens/child_dashboard.dart';
// import 'package:autism_app/screens/login_screen.dart';
// import 'package:autism_app/screens/home_screen.dart';
// import 'package:autism_app/screens/communication/aac_screen.dart'; // Added AAC screen

// // Services
// import 'package:autism_app/services/auth_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(AutismApp());
// }

// class AutismApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Autism Development App',
//       home: AuthCheck(),  // Decides if user goes to login or home
//       routes: {
//         "/home": (context) => HomeScreen(),
//         "/login": (context) => LoginScreen(),
//         "/dashboard": (context) => DashboardScreen(),
//         "/child_dashboard": (context) => ChildDashboard(),
//         "/tasks": (context) => TaskListScreen(),
//         "/games": (context) => GameScreen(),
//         "/aac": (context) => AACScreen(), // Added AAC route
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }

// // Automatically checks if user is logged in and redirects accordingly
// class AuthCheck extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String?>(
//       future: _authService.getUserRole(),  // Fetch user role
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(body: Center(child: CircularProgressIndicator()));
//         } else if (snapshot.hasData && snapshot.data != null) {
//           String role = snapshot.data!;
//           if (role == "parent") {
//             return DashboardScreen();
//           } else if (role == "child") {
//             return ChildDashboard();
//           } else {
//             return HomeScreen(); // Default fallback
//           }
//         } else {
//           return LoginScreen();
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

// Screens
import 'package:autism_app/screens/dashboard_screen.dart';
import 'package:autism_app/screens/task_list_screen.dart';
import 'package:autism_app/screens/game_screen.dart';
import 'package:autism_app/screens/auth_screen.dart';
import 'package:autism_app/screens/child_dashboard.dart';
import 'package:autism_app/screens/login_screen.dart';
import 'package:autism_app/screens/home_screen.dart';

// Services
import 'package:autism_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(AutismApp());
}

class AutismApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autism Development App',
      home: AuthCheck(), // Decides if user goes to login or home
      routes: {
        "/home": (context) => HomeScreen(),
        "/login": (context) => LoginScreen(),
        "/dashboard": (context) => DashboardScreen(),
        "/child_dashboard": (context) => ChildDashboard(),
        "/tasks": (context) => TaskListScreen(),
        "/games": (context) => GameScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

// Automatically checks if user is logged in and redirects accordingly
class AuthCheck extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData &&
         snapshot.data != null) {
          User user = snapshot.data!;
          return FutureBuilder<String?>(
            future: _authService.getUserRole(user.uid), // Pass user ID
            builder: (context, roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              } else if (roleSnapshot.hasData && roleSnapshot.data != null) {
                String role = roleSnapshot.data!;
                if (role == "parent") {
                  return DashboardScreen();
                } else if (role == "child") {
                  return ChildDashboard();
                } else {
                  return HomeScreen(); // Default fallback
                }
              } else {
                return LoginScreen();
              }
            },
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
