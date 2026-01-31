import 'package:cloud_firestore/cloud_firestore.dart';

class CertificateService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveCertificate({
    required String uid,
    required String url,
  }) async {
    await _db.collection('certificates').doc(uid).set({
      'url': url,
      'issuedAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<DocumentSnapshot> getCertificate(String uid) {
    return _db.collection('certificates').doc(uid).snapshots();
  }
}
