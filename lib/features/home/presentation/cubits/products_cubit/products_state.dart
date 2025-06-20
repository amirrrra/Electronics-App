import 'package:electronics_app/features/home/data/models/product_model.dart';

class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccessState({required this.products});
}

class ProductsFailureState extends ProductsState {
  final String errorMessage;

  ProductsFailureState({required this.errorMessage});
}
