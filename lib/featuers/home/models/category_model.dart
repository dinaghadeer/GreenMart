import 'dart:ui';

class CategoryModel {
  final String title;
  final String image;
  final Color bgColor;
  final Color borderColor;

  CategoryModel({
    required this.title,
    required this.image,
    required this.bgColor,
    required this.borderColor,
  });
}
final List<CategoryModel> categories = [
  CategoryModel(
    title: "Fresh Fruits & Vegetable",
    image: "assets/images/fruits.png",
    bgColor: Color(0xffE8F5E9),
    borderColor: Color(0xffA5D6A7),
  ),
  CategoryModel(
    title: "Cooking Oil & Ghee",
    image: "assets/images/oils.png",
    bgColor: Color(0xffFFF3E0),
    borderColor: Color(0xffFFCC80),
  ),
  CategoryModel(
    title: "Meat & Fish",
    image: "assets/images/meats.png",
    bgColor: Color(0xffFBE9E7),
    borderColor: Color(0xffFFAB91),
  ),
  CategoryModel(
    title: "Bakery & Snacks",
    image: "assets/images/bread.png",
    bgColor: Color(0xffF3E5F5),
    borderColor: Color(0xffCE93D8),
  ),
  CategoryModel(
    title: "Dairy & Eggs",
    image: "assets/images/dairy.png",
    bgColor: Color(0xffFFFDE7),
    borderColor: Color(0xffFFF59D),
  ),
  CategoryModel(
    title: "Beverages",
    image: "assets/images/beverages.png",
    bgColor: Color(0xffE3F2FD),
    borderColor: Color(0xff90CAF9),
  ),
];