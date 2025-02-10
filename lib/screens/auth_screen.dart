// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/auth_service.dart';
// import 'home_screen.dart'; // Home screen after login


// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final AuthService _authService = AuthService();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLogin = true; // Toggle between Login & Signup

//   void authenticate() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     User? user;

//     if (isLogin) {
//       user = await _authService.signIn(email, password);
//     } else {
//       user = await _authService.signUp(email, password);
//     }

//     if (user != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Authentication Failed!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: authenticate, child: Text(isLogin ? 'Login' : 'Sign Up')),
//             TextButton(
//               onPressed: () => setState(() => isLogin = !isLogin),
//               child: Text(isLogin ? 'Create Account' : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'home_screen.dart'; 

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final AuthService _authService = AuthService();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLogin = true; 

//   void authenticate() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     var user;

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter email and password")),
//       );
//       return;
//     }

//     if (isLogin) {
//       user = await _authService.signIn(email, password);
//     } else {
//       user = await _authService.signUp(email, password);
//     }

//     if (user != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Authentication Failed!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("AuthScreen isLogin: $isLogin"); // Debugging

//     return Scaffold(
//       appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: authenticate, child: Text(isLogin ? 'Login' : 'Sign Up')),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   isLogin = !isLogin;
//                   print("Switched to: ${isLogin ? 'Login' : 'Sign Up'}"); // Debugging
//                 });
//               },
//               child: Text(isLogin ? 'Create Account' : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'home_screen.dart'; 

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final AuthService _authService = AuthService();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLogin = true; 

//   void authenticate() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     var user;

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enter email and password")),
//       );
//       return;
//     }

//     if (isLogin) {
//       user = await _authService.signIn(email, password);
//     } else {
//       user = await _authService.signUp(email, password);
//     }

//     if (user != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Authentication Failed!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("AuthScreen isLogin: $isLogin"); // Debugging

//     return Scaffold(
//       appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: authenticate, child: Text(isLogin ? 'Login' : 'Sign Up')),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   isLogin = !isLogin;
//                   print("Switched to: ${isLogin ? 'Login' : 'Sign Up'}"); // Debugging
//                 });
//               },
//               child: Text(isLogin ? 'Create Account' : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/auth_service.dart';
// import 'home_screen.dart';
// import 'parent_dashboard.dart';
// import 'child_dashboard.dart';
// import 'therapist_dashboard.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final AuthService _authService = AuthService();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   String selectedRole = "parent"; // Default role
//   bool isLogin = true; // Toggle between login and signup

//   void authenticate() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     User? user;

//     if (isLogin) {
//       user = await _authService.signIn(email, password);
//     } else {
//       user = await _authService.signUp(email, password, selectedRole);
//     }

//     if (user != null) {
//       String? role = await _authService.getUserRole(user.uid);
//       if (role != null) navigateToDashboard(role);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Authentication Failed!')),
//       );
//     }
//   }

//   void navigateToDashboard(String role) {
//     Widget screen;
//     if (role == "parent") {
//       screen = ParentDashboard();
//     } else if (role == "child") {
//       screen = ChildDashboard();
//     } else {
//       screen = TherapistDashboard();
//     }

//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            
//             if (!isLogin)
//               DropdownButton<String>(
//                 value: selectedRole,
//                 onChanged: (value) => setState(() => selectedRole = value!),
//                 items: ["parent", "child", "therapist"].map((role) {
//                   return DropdownMenuItem(value: role, child: Text(role.toUpperCase()));
//                 }).toList(),
//               ),

//             SizedBox(height: 20),
//             ElevatedButton(onPressed: authenticate, child: Text(isLogin ? 'Login' : 'Sign Up')),
//             TextButton(
//               onPressed: () => setState(() => isLogin = !isLogin),
//               child: Text(isLogin ? 'Create Account' : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/auth_service.dart';
// import 'home_screen.dart';
// import 'parent_dashboard.dart';
// import 'child_dashboard.dart';
// import 'therapist_dashboard.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final AuthService _authService = AuthService();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLogin = true; // Toggle between Login & Signup

//   // Role selection dropdown
//   String selectedRole = "parent"; // Default role

//   void authenticate() async {
//   String email = emailController.text.trim();
//   String password = passwordController.text.trim();
//   User? user;

//   if (isLogin) {
//     user = await _authService.signIn(email, password);
//   } else {
//     user = await _authService.signUp(email, password, selectedRole);
//   }

//   if (user != null) {
//     String? role = await _authService.getUserRole(user.uid);
//     if (role != null) navigateToDashboard(context, role); // ✅ Fixed: Pass `context`
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Authentication Failed!')),
//     );
//   }
// }

//   void navigateToDashboard(BuildContext context, String role) {
//     print("Navigating to role: $role"); // Debugging
//     Widget screen;
//     if (role == "parent") {
//       screen = ParentDashboard();
//     } else if (role == "child") {
//       screen = ChildDashboard();
//     } else {
//       screen = TherapistDashboard();
//     }
//     Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => screen));
// }



  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
//             if (!isLogin) // Show Role Selection Only on Signup
//               DropdownButton<String>(
//                 value: selectedRole,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedRole = newValue!;
//                   });
//                 },
//                 items: ["parent", "child", "therapist"].map((String role) {
//                   return DropdownMenuItem<String>(
//                     value: role,
//                     child: Text(role),
//                   );
//                 }).toList(),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: authenticate, child: Text(isLogin ? 'Login' : 'Sign Up')),
//             TextButton(
//               onPressed: () => setState(() => isLogin = !isLogin),
//               child: Text(isLogin ? 'Create Account' : 'Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:autism_app/services/auth_service.dart';
import 'package:autism_app/screens/home_screen.dart';
import 'package:autism_app/screens/login_screen.dart';
import 'package:autism_app/screens/dashboard_screen.dart';
import 'package:autism_app/screens/child_dashboard.dart';

class AuthCheck extends StatefulWidget {
  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _authService.getUserRole("user_id"), // Ensure correct argument
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData && snapshot.data != null) {
          String role = snapshot.data!;
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
  }
}
