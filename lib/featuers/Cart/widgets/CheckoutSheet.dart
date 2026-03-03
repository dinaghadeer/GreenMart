import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/funcations/CartManager.dart';
import '../../../core/utils/colors.dart';
import '../page/SuccessScreen.dart';

class CheckoutSheet extends StatelessWidget {
  const CheckoutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: 18),
            const Divider(color: AppColors.borderColor),
            const SizedBox(height: 14),

            _buildRow(
              title: "Delivery",
              subtitle: "Select Method",
            ),

            const SizedBox(height: 18),
            const Divider(color: AppColors.borderColor),
            const SizedBox(height: 14),

            _buildRow(
              title: "Payment",
              subtitle: "Card",
              icon: Icons.credit_card,
            ),

            const SizedBox(height: 18),
            const Divider(color: AppColors.borderColor),
            const SizedBox(height: 14),

            _buildRow(
              title: "Promo Code",
              subtitle: "Pick discount",
            ),

            const SizedBox(height: 18),
            const Divider(color: AppColors.borderColor),
            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Cost",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  CartManager.totalPrice.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Spacer(),

            const Text(
              "By placing an order you agree to our\nTerms And Conditions",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {

                  CartManager.clear();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SuccessScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String title,
    required String subtitle,
    IconData? icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            if (icon != null)
              Icon(icon, size: 20, color: Colors.grey),
            if (icon != null) const SizedBox(width: 8),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}