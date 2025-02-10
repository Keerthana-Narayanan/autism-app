import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  final CollectionReference _taskCollection = FirebaseFirestore.instance.collection('tasks');

  // Add a new task
  Future<void> addTask(String title) async {
    await _taskCollection.add({
      'title': title,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Get all tasks (real-time updates)
  Stream<QuerySnapshot> getTasks() {
    return _taskCollection.orderBy('createdAt', descending: true).snapshots();
  }

  // Toggle task completion status
  Future<void> toggleTask(String taskId, bool currentStatus) async {
    await _taskCollection.doc(taskId).update({'completed': !currentStatus});
  }
}
