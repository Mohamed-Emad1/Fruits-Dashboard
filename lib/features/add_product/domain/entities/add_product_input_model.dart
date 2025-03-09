import 'dart:io';

class AddProductInputEntity {
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

  AddProductInputEntity( 
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
      this.imageUrl});
}
