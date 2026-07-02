import '../../models/procucts.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {

  final List<Products> products;

  ProductLoaded(this.products);

}

class ProductError extends ProductState {

  final String message;

  ProductError(this.message);

}