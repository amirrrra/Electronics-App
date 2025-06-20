import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:electronics_app/features/home/data/repos/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ApiService _apiService;

  ProductsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts() async {
    try {
      var result = await _apiService.get('v1/all/products');
      final products = result.map((e) => ProductModel.fromJson(e)).toList();
      return Right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchCategories() async {
    try {
      var result = await _apiService.get('v1/all/categories');
      var categories = result.map((e) => e.toString()).toList();
      return Right(categories);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchCategoryProducts(
    String category,
  ) async {
    try {
      var result = await _apiService.get('v1/products/category/$category');
      final products = result.map((e) => ProductModel.fromJson(e)).toList();

      return Right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(Failure(errMessage: e.toString()));
    }
  }
}
