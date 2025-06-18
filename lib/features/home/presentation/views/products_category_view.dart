import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:electronics_app/features/home/presentation/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/category_products_cubit/category_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/products_grid_widget.dart';

class ProductsCategoryView extends StatelessWidget {
  const ProductsCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(category),backgroundColor: AppColors.transparent,),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (BuildContext context, state) {
          if (state is CategoryProductsSuccessState) {
            return ProductsGridWidget(
              products: state.products,
            );
          } else if (state is CategoryProductsFailureState) {
            return ErrorWidget(state.errorMessage);
          } else {
            final dummyProducts = List.generate(
              10,
              (index) => ProductModel(
                id: 0,
                name: 'Loading...',
                category: 'Dummy',
                description: 'Loading description...',
                price: 0.0,
                discount: 0,
                image: '',
              ),
            );
            return Skeletonizer(
              child: ProductsGridWidget(
                products: dummyProducts,
              ),
            );
          }
        },
      ),
    );
  }
}
