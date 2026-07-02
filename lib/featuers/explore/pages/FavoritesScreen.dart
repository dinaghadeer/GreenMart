import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/funcations/CartManager.dart';
//import '../../../core/funcations/FavoritesManager.dart';
import '../../../core/utils/colors.dart';
import '../../models/procucts.dart';
import '../cubit/FavoriteCubit.dart';
import 'ProductDetailsScreen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final favorites = FavoritesManager.favorites;

    return BlocBuilder<FavoriteCubit, List<Products>>(
      builder: (context, favorites) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Favorites',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: favorites.isEmpty
              ? const Center(
            child: Text(
              "No favorite products yet",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          )
              : Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: favorites.length,
                  separatorBuilder: (_, __) => Container(
                    height: 1,
                    color: AppColors.borderColor,
                  ),
                  itemBuilder: (context, index) {
                    final product = favorites[index];

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      leading: Image.network(
                        product.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // subtitle: Text(product.size, style: const TextStyle(color: Colors.grey)),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailsScreen(
                                    product: product,
                                  ),
                                ),
                              );
                              // refresh in case favorite changes
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // add all favorite products to cart
                      CartManager.addAll(favorites);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'All favorites added to cart!',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Add All to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}