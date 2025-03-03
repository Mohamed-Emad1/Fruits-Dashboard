import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failure.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';

class ImageRepoImpl extends ImageRepo{
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}