import 'package:electronics_app/features/home/presentation/cubits/categories_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'category_widget.dart';

class CategoryBuilderWidget extends StatelessWidget {
  const CategoryBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return CategoryWidget(categoriesNames: state.categories);
        } else if (state is CategoriesFailureState) {
          return ErrorWidget(state.errorMessage);
        } else {
          return Skeletonizer(child: CategoryWidget(categoriesNames: []));
        }
      },
    );
  }
}
