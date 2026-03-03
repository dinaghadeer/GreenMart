import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import '../widgets/ExclusiveOfferWidget.dart';
import '../widgets/best_selling_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1.2,
              ),
            ),
            child: TextFormField(
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                hintText: "Search Store",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.greyColor,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 10,
                ),
              ),
            ),
          ),

          const SizedBox(height: 28),
          const ExclusiveOfferWidget(),
          const SizedBox(height: 20),
          const BestSellingBuilder(),
        ],
      ),
    );
  }
}