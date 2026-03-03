import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/textStyles.dart';
import '../../home/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model});
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
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                Text(
                  model.name,
                  style: TextStyles.bodyStyle(
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "7pcs",
                  style: TextStyles.smallStyle(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "\$12.00",
                  style: TextStyles.bodyStyle(
                    weight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
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