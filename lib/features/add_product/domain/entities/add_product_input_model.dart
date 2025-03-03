import 'dart:io';

class AddProductInputModel {
  final String name;
  final num price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  final String? imageUrl;

  AddProductInputModel(
      {required this.name,
      required this.price,
      required this.code,
      required this.description,
      required this.image,
      required this.isFeatured,
      this.imageUrl});
}
