import 'dart:io';

import 'package:fruits_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';

class AddProductInputModel {
  final String name;
  final num price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCallories;
  final int unitAmount;
  final List<ReviewModel> reviews;

  AddProductInputModel(
      {required this.name,
      required this.price,
      required this.code,
      required this.expirationMonths,
      required this.isOrganic,
      required this.numOfCallories,
      required this.unitAmount,
      required this.description,
      required this.image,
      required this.isFeatured,
      required this.reviews,
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
        expirationMonths: entity.expirationMonths,
        isOrganic: entity.isOrganic,
        numOfCallories: entity.numOfCallories,
        unitAmount: entity.unitAmount,
        reviews: entity.reviews
            .map((element) => ReviewModel.fromEntity(element))
            .toList());
  }

  toJson() {
    return {
      "name": name,
      "price": price,
      "code": code,
      "description": description,
      "isFeatured": isFeatured,
      "imageUrl": imageUrl,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "numOfCallories": numOfCallories,
      "unitAmount": unitAmount,
      "reviews": reviews.map((e) => e.toJson()).toList()
    };
  }
}
