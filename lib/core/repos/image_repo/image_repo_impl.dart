import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failure.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/utils/backend_endpoints.dart';

class ImageRepoImpl extends ImageRepo {
  final StorageService _fireStorage;

  ImageRepoImpl(this._fireStorage);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await _fireStorage.uploadFile(image, BackendEndpoints.images);
      return Right(url);
    } catch (e) {
      return const Left(ServerFailure("Failed to Upload Image"));
    }
  }
}
