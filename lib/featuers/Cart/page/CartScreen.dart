import 'package:flutter/material.dart';
import '../../../core/funcations/CartManager.dart';
import '../../../core/utils/colors.dart';
import '../../home/models/category_product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.cartItems.entries.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Scrollable cart items
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.separated(
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => Container(
                height: 1,
                color: AppColors.borderColor,
                margin: const EdgeInsets.symmetric(vertical: 16),
              ),
              itemBuilder: (context, index) {
                final product = cartItems[index].key;
                final quantity = cartItems[index].value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product image
                      Image.asset(
                        product.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),

                      // Product details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(product.size, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 8),

                            // Quantity controls
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      CartManager.decrease(product);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.remove, size: 16),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(quantity.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      CartManager.add(product);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.add, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Price and remove
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close, size: 20, color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                CartManager.remove(product);
                              });
                            },
                          ),

                          Text('\$${(product.price * quantity).toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom bar with total and checkout
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                // Total price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text('\$${CartManager.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                // Go to Checkout button
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    onPressed: () {
                      // Navigate to checkout screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Proceed to checkout')),
                      );
                    },
                    child: const Text('Checkout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.whiteColor)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}