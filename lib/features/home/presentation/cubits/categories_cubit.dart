import 'package:electronics_app/features/home/data/repos/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_state.dart';

class CategoriesCubit extends Cubit<ProductsState> {
  CategoriesCubit(this._productsRepo) : super(ProductsInitialState());
  final ProductsRepo _productsRepo;

  Future<void> fetchAllProducts() async {
    emit(ProductsLoadingState());
    final result = await _productsRepo.fetchAllProducts();

    result.fold(
      (failure) => emit(ProductsFailureState(errorMessage: failure.errMessage)),
      (products) => emit(ProductsSuccessState(products: products)),
    );
  }
}
