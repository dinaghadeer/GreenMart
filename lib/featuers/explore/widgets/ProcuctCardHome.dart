import 'package:flutter/material.dart';
import '../../../core/funcations/CartManager.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/textStyles.dart';
import '../../home/models/product_model.dart';

class ProductCardHome extends StatelessWidget {
  const ProductCardHome({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(model.image),
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyles.bodyStyle(
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "7pcs",
                  style: TextStyles.smallStyle(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "\$${model.price.toStringAsFixed(2)}",
                  style: TextStyles.bodyStyle(
                    weight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    CartManager.add(model);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${model.name} added to cart"),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}