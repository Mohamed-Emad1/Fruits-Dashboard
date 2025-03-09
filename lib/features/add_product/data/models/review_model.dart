import 'package:fruits_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String reviewDescription;
  final num rating;
  final String imageUrl;
  final String date;

  ReviewModel(
      {required this.name,
      required this.reviewDescription,
      required this.rating,
      required this.imageUrl,
      required this.date});

      factory ReviewModel.fromEntity(ReviewEntity reviewModel){
        return ReviewModel(
          name: reviewModel.name,
          reviewDescription: reviewModel.reviewDescription,
          rating: reviewModel.rating,
          imageUrl: reviewModel.imageUrl,
          date: reviewModel.date
        );
      }

      factory ReviewModel.fromJson(Map<String,dynamic> json){
        return ReviewModel(
          name: json["name"],
          reviewDescription: json["reviewDescription"],
          rating: json["rating"],
          imageUrl: json["imageUrl"],
          date: json["date"]
        );
      }


      toJson(){
        return {
          "name":name,
          "reviewDescription":reviewDescription,
          "rating":rating,
          "imageUrl":imageUrl,
          "date":date
        };
      }
}
