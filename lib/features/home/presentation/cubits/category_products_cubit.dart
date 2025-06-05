import 'package:electronics_app/features/home/data/repos/products_repo.dart';
import 'package:electronics_app/features/home/presentation/cubits/categories_state.dart';
import 'package:electronics_app/features/home/presentation/cubits/category_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this._productsRepo)
    : super(CategoryProductsLoadingState());
  final ProductsRepo _productsRepo;

  Future<void> fetchCategories(String category) async {
    emit(CategoryProductsLoadingState());
    final result = await _productsRepo.fetchCategoryProducts(category);
    result.fold(
      (failure) =>
          emit(CategoryProductsFailureState(errorMessage: failure.errMessage)),
      (categories) => emit(CategoryProductsSuccessState(categories)),
    );
  }
}
