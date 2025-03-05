import 'dart:io';

import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';

class AddProductInputModel {
  final String name;
  final num price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;

  AddProductInputModel(
      {required this.name,
      required this.price,
      required this.code,
      required this.description,
      required this.image,
      required this.isFeatured,
      this.imageUrl});

    factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
      return AddProductInputModel(
        name: entity.name,
        price: entity.price,
        code: entity.code,
        description: entity.description,
        image: entity.image,
        isFeatured: entity.isFeatured,
        imageUrl: entity.imageUrl,
      );
    }  

    toJson() {
      return {
        "name": name,
        "price": price,
        "code": code,
        "description": description,
        "image": image,
        "isFeatured": isFeatured,
        "imageUrl": imageUrl,
      };
    }
}
