import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadCertificate({
    required File file,
    required String uid,
  }) async {
    final ref = _storage
        .ref()
        .child('certificates')
        .child('$uid.pdf');

    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
