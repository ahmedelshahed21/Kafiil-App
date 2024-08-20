class ServicesModel {
  final int id;
  final String mainImage;
  final double price;
  final String title;
  final double averageRating;
  final double completedSalesCount;

  ServicesModel({
    required this.id,
    required this.mainImage,
    required this.price,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      id: json['id'],
      mainImage: json['main_image'],
      price: json['price'].toDouble(),
      title: json['title'],
      averageRating: json['average_rating'].toDouble(),
      completedSalesCount: json['completed_sales_count'].toDouble()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main_image': mainImage,
      'price': price,
      'title': title,
      'average_rating': averageRating,
      'completed_sales_count':completedSalesCount
    };
  }
}
