import 'package:dartz/dartz.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts();
  Future<Either<Failure, List<String>>> fetchCategories();
  Future<Either<Failure, List<ProductModel>>> fetchCategoryProducts(String category);
}
