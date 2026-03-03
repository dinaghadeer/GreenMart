import 'package:flutter/material.dart';
import '../../../core/funcations/CartManager.dart';
import '../../../core/funcations/FavoritesManager.dart';
import '../../../core/utils/colors.dart';
import '../../home/models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  bool isFavorite = false;

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(), // ✅ Back button
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });

              if (isFavorite) {
                FavoritesManager.add(product);
              } else {
                FavoritesManager.remove(product);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Product image
          Container(
            width: double.infinity,
            height: 250,
            color: const Color(0xFFF5F5F5),
            child: Center(
              child: Image.asset(product.image, height: 150, fit: BoxFit.contain),
            ),
          ),

          // Scrollable section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(product.size, style: const TextStyle(fontSize: 14, color: AppColors.greyColor)),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity selector
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
                              child: Text(quantity.toString(),
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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

                      // Total price
                      Text('\$${(product.price * quantity).toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        // Add product to cart with quantity
                        CartManager.addMultiple(product, quantity);

                        // Optional: Feedback
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$quantity x ${product.name} added to cart"),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
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
}