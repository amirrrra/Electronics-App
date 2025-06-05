import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/features/home/data/repos/products_repo_impl.dart';
import 'package:electronics_app/features/home/presentation/cubits/categories_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/constants.dart';

void main() {
  runApp(const ElectronicsApp());
}

class ElectronicsApp extends StatelessWidget {
  const ElectronicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCubit>(
          create: (context) => ProductsCubit(ProductsRepoImpl(ApiService())),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(ProductsRepoImpl(ApiService())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Constants.kPoppins,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: AppColors.primaryColor),
          ),
          scaffoldBackgroundColor: AppColors.white,
        ),

        onGenerateRoute: AppRoutes.onGenerateRoute,
        // initialRoute: AppRoutes.login,
        initialRoute: AppRoutes.home,
        // initialRoute: AppRoutes.productDetails,
      ),
    );
  }
}
