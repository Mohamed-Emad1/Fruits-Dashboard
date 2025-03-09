import 'dart:io';

import 'package:fruits_dashboard/core/secrets/supabase_secters.dart';
import 'package:fruits_dashboard/core/services/storage_constants.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBucket({required String bucketName}) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExist = false;
    for (var bucket in buckets) {
      if (bucket.name == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initialize() async {
    _supabase = await Supabase.initialize(
      url: SupabaseSecters.supabaseUrl,
      anonKey: SupabaseSecters.supabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    var fileName = b.basename(file.path);
    var extension = b.extension(file.path);
    await _supabase.client.storage.from(fruitsImages).upload(
          "$path/$fileName.$extension",
          file,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    final String publicUrl = _supabase.client.storage
        .from(fruitsImages)
        .getPublicUrl("$path/$fileName.$extension");

    return publicUrl;
  }
}
