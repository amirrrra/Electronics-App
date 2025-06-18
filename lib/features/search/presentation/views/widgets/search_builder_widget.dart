import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/products_grid_widget.dart';
import 'package:electronics_app/features/search/presentation/cubits/search_cubit.dart';
import 'package:electronics_app/features/search/presentation/cubits/search_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchBuilderWidget extends StatelessWidget {
  const SearchBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ProductsGridWidget(products: state.products);
        } else if (state is SearchFailureState) {
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
          return Skeletonizer.sliver(
            child: ProductsGridWidget(products: dummyProducts),
          );
        }
      },
    );
  }
}
