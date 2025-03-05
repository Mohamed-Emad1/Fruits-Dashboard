import 'dart:io';

abstract class StorageService {
  Future<String> uploadFile(File file, String path); //upload with base64
}