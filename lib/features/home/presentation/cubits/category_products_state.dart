import 'package:electronics_app/features/home/data/models/product_model.dart';

class CategoryProductsState {}

class CategoryProductsInitialState extends CategoryProductsState {}

class CategoryProductsLoadingState extends CategoryProductsState {}

class CategoryProductsSuccessState extends CategoryProductsState {
  final List<ProductModel> products;

  CategoryProductsSuccessState(this.products);
}

class CategoryProductsFailureState extends CategoryProductsState {
  final String errorMessage;

  CategoryProductsFailureState({required this.errorMessage});
}
