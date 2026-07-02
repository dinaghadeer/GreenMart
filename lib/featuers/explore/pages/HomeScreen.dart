import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import '../../../core/services/API_Service.dart';
import '../../../core/utils/colors.dart';
import '../../models/procucts.dart';
import '../cubit/ProductCubit.dart';
import '../cubit/ProductState.dart';
import '../widgets/ExclusiveOfferWidget.dart';
import '../widgets/best_selling_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {
    //final ApiService api = ApiService();
    @override
    void initState() {
      super.initState();

      context.read<ProductCubit>().getProducts();
    }

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ProductError) {
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
          }
          if (state is ProductLoaded) {
            final products = state.products;
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

                    ExclusiveOfferWidget(products: products),

                    const SizedBox(height: 24),

                    BestSellingBuilder(products: products),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
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

