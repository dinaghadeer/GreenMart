import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenmart/featuers/home/models/product_model.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/textStyles.dart';
import 'ProcuctCardHome.dart';

class ExclusiveOfferWidget extends StatelessWidget {
  const ExclusiveOfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Exclusive Offer", style: TextStyles.titleStyle(size: 22)),
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
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardHome(model:products[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}

