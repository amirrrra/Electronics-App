import 'package:electronics_app/features/home/data/repos/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ProductsRepo _productsRepo;
  SearchCubit(this._productsRepo) : super(SearchInitialState());

  Future<void> fetchRelevantProducts(String query) async {
    var result = await _productsRepo.fetchAllProducts();
    result.fold(
      (failure) => emit(SearchFailureState(failure.errMessage)),
      (products) => emit(SearchSuccessState(products)),
    );
  }
}
