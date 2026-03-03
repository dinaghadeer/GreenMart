import 'package:flutter/material.dart';
import '../../../core/funcations/FavoritesManager.dart';
import '../../../core/utils/colors.dart';
import '../../home/models/category_product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  bool isFavorite = false; // new state for heart icon

  void increase() => setState(() => quantity++);
  void decrease() => setState(() => quantity = quantity > 1 ? quantity - 1 : 1);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });

                // Optional: Add/remove from favorite list globally
                if (isFavorite) {
                  FavoritesManager.add(product);
                } else {
                  FavoritesManager.remove(product);
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Grey Container - Taller
          Container(
            width: double.infinity,
            height: 250, // increased height
            color: const Color(0xFFF5F5F5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  product.image,
                  height: 150, // image size stays the same
                  fit: BoxFit.contain,
                ),

              ],
            ),
          ),

          // Scrollable Content Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.size,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyColor,
                    ),
                  ),

                  // Quantity and Price Row
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: decrease,
                              icon: const Icon(Icons.remove, size: 20, color: AppColors.greyColor),
                              constraints: const BoxConstraints(),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.grey.shade300),
                                  right: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: increase,
                              icon: const Icon(Icons.add, size: 20, color: AppColors.primaryColor),
                              constraints: const BoxConstraints(),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                          ],
                        ),
                      ),

                      // Price
                      Text(
                        '\$${(product.price * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // ----- Description -----
                  Container(height: 1, color: AppColors.borderColor), // separator line

                  // ----- Product Detail -----
                  _buildSection(
                    title: 'Product Detail',
                    child: Text(
                      'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthful and varied diet.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ),

                  // ----- Nutritions -----
                  _buildSection(
                    title: 'Nutritions',
                    child: Row(
                      children: const [
                        _NutritionItem(label: 'Calories', value: '52 kcal'),
                        _NutritionItem(label: 'Carbs', value: '14 g'),
                        _NutritionItem(label: 'Protein', value: '0.3 g'),
                      ],
                    ),
                  ),

                  // ----- Reviews -----
                  _buildSection(
                    title: 'Reviews',
                    child: Row(
                      children: List.generate(
                        5,
                            (index) => const Icon(Icons.star, color: Color(0xFFFFC107), size: 28),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Add To Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build foldable sections with separators
  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      children: [
        ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: child,
            ),
          ],
        ),
        Container(height: 1, color: AppColors.borderColor), // separator line
      ],
    );
  }
}

// Simple nutrition item widget
class _NutritionItem extends StatelessWidget {
  final String label;
  final String value;
  const _NutritionItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: AppColors.borderColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}