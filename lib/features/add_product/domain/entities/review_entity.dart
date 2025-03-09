class ReviewEntity {
  final String name;
  final String reviewDescription;
  final num rating;
  final String imageUrl;
  final String date;

  ReviewEntity(
      {required this.name,
      required this.reviewDescription,
      required this.rating,
      required this.imageUrl,
      required this.date});
}
