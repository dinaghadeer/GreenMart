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
final List<ProductModel> products = [
  ProductModel(
    id: '1',
    name: "Diet Coke",
    image: "assets/images/dietCola.png",
    description: "Diet Coke is a carbonated soft drink that is popular in the United States.",
    size: "355ml",
    price: 1.99,
  ),
  ProductModel(
    id: '2',
    name: "Sprite Can",
    image: "assets/images/sprite.png",
    description: "Sprite is a carbonated soft drink that is popular in the United States.",
    size: "325ml",
    price: 1.50,
  ),
  ProductModel(
    id: '3',
    name: "Apple & Grape Juice",
    image: "assets/images/grapeJuice.png",
    description: "Apple & Grape Juice is a carbonated soft drink that is popular in the United States.",
    size: "2L",
    price: 15.99,
  ),
  ProductModel(
    id: '4',
    name: "Orange Juice",
    image: "assets/images/orangeJuice.png",
    description: "Orange Juice is a carbonated soft drink that is popular in the United States.",
    size: "2L",
    price: 15.99,
  ),
  ProductModel(
    id: '5',
    name: "Coca Cola Can",
    image: "assets/images/cola.png",
    description: "Coca Cola is a carbonated soft drink that is popular in the United States.",
    size: "325ml",
    price: 4.99,
  ),
  ProductModel(
    id: '6',
    name: "Pepsi Can",
    image: "assets/images/pepsi.png",
    description: "Pepsi is a carbonated soft drink that is popular in the United States.",
    size: "330ml",
    price: 4.99,
  ),
];