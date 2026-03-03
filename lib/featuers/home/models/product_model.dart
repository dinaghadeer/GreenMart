class ProductModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String size;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.size,
    required this.price,
  });
}
List <ProductModel> products = [
  ProductModel(
    id: '1',
    name: "Red Apple",
    image: "assets/images/apple.png",
    description: "Red Apple is a carbonated soft drink that is popular in the United States.",
    size: "1kg",
    price: 4.99,

  ),
  ProductModel(
    id: '2',
    name: "Bananas",
    image: "assets/images/banana.png",
    description: "Bananas is a carbonated soft drink that is popular in the United States.",
    size: "7pcs",
    price: 4.99,
  ),
  ProductModel(
    id: '3',
    name: "ginger",
    image: "assets/images/ginger.png",
    description: "ginger is a carbonated soft drink that is popular in the United States.",
    size: "250gm",
    price: 4.99,
  ),
  ProductModel(
    id: '4',
    name: "Bell Pepper Red",
    image: "assets/images/Bell Pepper Red.png",
    description: "Bell Pepper Red is a carbonated soft drink that is popular in the United States.",
    size: "7pcs",
    price: 12.00,
  ),

];