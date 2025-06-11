import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'products_grid_widget.dart';

class ProductsBuilderWidget extends StatelessWidget {
  const ProductsBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return ProductsGridWidget(products: state.products);
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(child: ErrorWidget(state.errorMessage));
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
          return Skeletonizer.sliver(
            child: ProductsGridWidget(products: dummyProducts),
          );
        }
      },
    );
  }
}
