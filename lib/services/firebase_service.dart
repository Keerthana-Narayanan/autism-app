import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // --------------------- Firestore Operations ---------------------

  // Add user data to Firestore
  Future<void> addUserData(String userId, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(userId).set(userData);
      debugPrint('✅ User data added successfully');
    } catch (e) {
      debugPrint('❌ Error adding user data: ${e.toString()}');
    }
  }

  // Get user data from Firestore (single document)
  Future<DocumentSnapshot?> getUserData(String userId) async {
    try {
      return await _db.collection('users').doc(userId).get();
    } catch (e) {
      debugPrint('❌ Error fetching user data: ${e.toString()}');
      return null;
    }
  }

  // Get all users from Firestore
  Future<List<QueryDocumentSnapshot>> getAllUsers() async {
    try {
      QuerySnapshot snapshot = await _db.collection('users').get();
      return snapshot.docs;
    } catch (e) {
      debugPrint('❌ Error fetching all users: ${e.toString()}');
      return [];
    }
  }

  // Update user data in Firestore
  Future<void> updateUserData(String userId, Map<String, dynamic> updatedData) async {
    try {
      await _db.collection('users').doc(userId).update(updatedData);
      debugPrint('✅ User data updated successfully');
    } catch (e) {
      debugPrint('❌ Error updating user data: ${e.toString()}');
    }
  }

  // Delete user data from Firestore
  Future<void> deleteUserData(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
      debugPrint('✅ User data deleted successfully');
    } catch (e) {
      debugPrint('❌ Error deleting user data: ${e.toString()}');
    }
  }

  // Listen to real-time user data updates
  Stream<List<Map<String, dynamic>>> getUserStream() {
  return _db.collection('users').snapshots().map((snapshot) {
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>?)
        .where((data) => data != null) // Filter out null values
        .cast<Map<String, dynamic>>() // Ensure correct casting
        .toList();
  });
}


  // --------------------- Firebase Authentication ---------------------

  // Sign up new user
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('❌ Error signing up: ${e.toString()}');
      return null;
    }
  }

  // Sign in existing user
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('❌ Error signing in: ${e.toString()}');
      return null;
    }
  }

  // Sign out the user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      debugPrint('✅ User signed out successfully');
    } catch (e) {
      debugPrint('❌ Error signing out: ${e.toString()}');
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // --------------------- Firebase Storage ---------------------

  // Upload a file to Firebase Storage
  Future<String?> uploadFile(String filePath, String fileName) async {
    try {
      File file = File(filePath);
      Reference ref = _storage.ref().child('uploads/$fileName');

      await ref.putFile(file);
      String downloadURL = await ref.getDownloadURL();

      debugPrint('✅ File uploaded successfully: $downloadURL');
      return downloadURL;
    } catch (e) {
      debugPrint('❌ Error uploading file: ${e.toString()}');
      return null;
    }
  }

  // Download a file URL from Firebase Storage
  Future<String?> getDownloadUrl(String fileName) async {
    try {
      String fileURL = await _storage.ref('uploads/$fileName').getDownloadURL();
      debugPrint('✅ File download URL retrieved: $fileURL');
      return fileURL;
    } catch (e) {
      debugPrint('❌ Error getting download URL: ${e.toString()}');
      return null;
    }
  }
}
