import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/API_Service.dart';
import 'ProductState.dart';

class ProductCubit extends Cubit<ProductState> {

  final ApiService api;

  ProductCubit(this.api)
      : super(ProductInitial());

  Future<void> getProducts() async {

    emit(ProductLoading());

    try {

      final products = await api.fetchProducts();

      emit(ProductLoaded(products));

    }

    catch(e){

      emit(ProductError(e.toString()));

    }

  }

}