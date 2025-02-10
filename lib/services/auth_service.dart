// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Sign Up with Email & Password
//   Future<User?> signUp(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
// //login method
//   Future<User?> loginWithEmail(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print("Login Failed: ${e.toString()}");
//       return null;
//     }
//   }

//   // Sign In with Email & Password
//   Future<User?> signIn(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }

//   // Logout
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Sign Up with Role
//   Future<User?> signUp(String email, String password, String role) async {
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = userCredential.user;

//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).set({
//           'email': email,
//           'role': role,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         return user;
//       }

    
//     } catch (e) {
//       print("Error signing up: $e");
//     }
//     return null;
//   }

//   // Sign In
//   Future<User?> signIn(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print("Error signing in: $e");
//       return null;
//     }
//   }

//   // Get User Role
//   Future<String?> getUserRole(String uid) async {
//     try {
//       DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
//       return doc['role'];  // Return role from Firestore
//     } catch (e) {
//       print("Error getting user role: $e");
//       return null;
//     }
//   }


//   // Logout
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// **Sign Up with Email, Password, and Role**
  Future<User?> signUp(String email, String password, String role) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Store user info in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'role': role,
          'createdAt': FieldValue.serverTimestamp(),
        });

        print("✅ User registered: ${user.uid}");
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error: ${e.message}");
    } catch (e) {
      print("❌ Unknown Error during sign-up: $e");
    }
    return null;
  }

  /// **Sign In with Email and Password**
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        print("✅ User signed in: ${user.uid}");

        // Fetch and print user role for debugging
        String? role = await getUserRole(user.uid);
        print("🎭 User Role: $role");

        return user;
      }
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error: ${e.message}");
    } catch (e) {
      print("❌ Unknown Error during sign-in: $e");
    }
    return null;
  }

  /// **Get User Role from Firestore**
  Future<String?> getUserRole(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      
      if (doc.exists && doc.data() != null) {
        return (doc.data() as Map<String, dynamic>)['role'];
      } else {
        print("⚠️ No user data found for UID: $uid");
        return null;
      }
    } catch (e) {
      print("❌ Error fetching user role: $e");
      return null;
    }
  }

  /// **Sign Out**
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("✅ User signed out");
    } catch (e) {
      print("❌ Error signing out: $e");
    }
  }
}

