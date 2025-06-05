import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:electronics_app/features/home/data/repos/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepo) : super(ProductsInitialState());
  final ProductsRepo _productsRepo;

  Future<void> fetchAllProducts() async {
    emit(ProductsLoadingState());
    final result = await _productsRepo.fetchAllProducts();
    result.fold(
      (failure) => emit(ProductsFailureState(errorMessage: failure.errMessage)),
      (products) => emit(ProductsSuccessState(productModel: products)),
    );
  }
}
