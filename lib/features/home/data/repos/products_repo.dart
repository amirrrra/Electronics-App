import 'package:dartz/dartz.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductModel>> fetchAllProducts();
  Future<Either<Failure, dynamic>> fetchCategories();
  Future<Either<Failure, ProductModel>> fetchCategoryProducts(String category);
}
