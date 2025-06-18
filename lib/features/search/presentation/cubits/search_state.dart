import 'package:electronics_app/features/home/data/models/product_model.dart';

class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<ProductModel> products;
  SearchSuccessState(this.products);
}

class SearchEmptyState extends SearchState {}
