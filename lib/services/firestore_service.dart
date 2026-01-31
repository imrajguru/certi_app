import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String email,
    required String role,
  }) async {
    await _db.collection('users').doc(uid).set({
      'email': email,
      'role': role,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<String?> getUserRole(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (doc.exists) {
      return doc.data()?['role'];
    }
    return null;
  }
}
