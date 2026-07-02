class Products {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final double rating;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: (json["price"] as num).toDouble(),
      image: json["thumbnail"],
      rating: (json["rating"] as num).toDouble(),
    );
  }
}