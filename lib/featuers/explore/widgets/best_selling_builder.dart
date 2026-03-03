import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenmart/featuers/home/models/product_model.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/textStyles.dart';
import 'ProcuctCardHome.dart';

class BestSellingBuilder extends StatelessWidget {
  const BestSellingBuilder({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Best Selling", style: TextStyles.titleStyle(size: 22)),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: TextStyles.bodyStyle(
                  color: AppColors.primaryColor,
                  weight: FontWeight.w400,
                  size: 14
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
       GridView.builder(
         physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 250,

          ),

           itemBuilder: (context, index) {
             return ProductCardHome(model: products[index]);
           },
           itemCount: products.length,
       )
      ],
    );
  }
}

