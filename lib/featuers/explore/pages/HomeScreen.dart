import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/colors.dart';
import '../widgets/ExclusiveOfferWidget.dart';
import '../widgets/best_selling_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 20),

            SvgPicture.asset(
              "assets/images/logo.svg",
              height: 55,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: 25),

            _buildSearchField(),

            const SizedBox(height: 30),

            const ExclusiveOfferWidget(),

            const SizedBox(height: 24),

            const BestSellingBuilder(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Search Field Widget
  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: "Search Store",
          hintStyle: TextStyle(color: Colors.grey.shade500),
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
    );
  }
}