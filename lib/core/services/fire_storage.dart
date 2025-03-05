import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storage = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    var fileName = b.basename(file.path);
    var extension = b.extension(file.path);
    var ref = storage.child("$path/$fileName.$extension");
    try {
      await ref.putFile(file);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
    var downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }
}
