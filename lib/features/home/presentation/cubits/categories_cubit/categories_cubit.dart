import 'package:electronics_app/features/home/data/repos/products_repo.dart';
import 'package:electronics_app/features/home/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._productsRepo) : super(CategoriesLoadingState());
  final ProductsRepo _productsRepo;

  Future<void> fetchCategories() async {
    emit(CategoriesLoadingState());
    final result = await _productsRepo.fetchCategories();
    result.fold(
      (failure) =>
          emit(CategoriesFailureState(errorMessage: failure.errMessage)),
      (categories) => emit(CategoriesSuccessState(categories)),
    );
  }
}
