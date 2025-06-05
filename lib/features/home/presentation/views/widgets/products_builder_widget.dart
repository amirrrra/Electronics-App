import 'package:electronics_app/features/home/presentation/cubits/products_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_state.dart';
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
        print(state.toString());
        if (state is ProductsSuccessState) {
          return ProductsGridWidget(products: state.products,);
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(child: ErrorWidget(state.errorMessage));
        } else  {
          return Skeletonizer.sliver(child: ProductsGridWidget(products: [],));
        }
      },
    );
  }
}
