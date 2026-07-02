import 'package:flutter/material.dart';
import '../../../core/services/API_Service.dart';
import '../../../core/utils/colors.dart';
import '../../models/category_model.dart';
// import '../../home/models/product_model.dart';
import '../../models/procucts.dart';
import '../widgets/ProductCard.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // static list to filter based on category.id
    //final List<ProductModel> categoryProducts = category_products;
    ApiService api = ApiService();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          category.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<List<Products>>(
          future: ApiService().fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16),

              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),

                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
              ),
            );
          },
      ),
    );
  }
}