import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/features/home/data/repos/products_repo_impl.dart';
import 'package:electronics_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:electronics_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_cubit.dart';
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
        BlocProvider(
          create: (context) {
            return ProductsCubit(ProductsRepoImpl(ApiService()))
              ..fetchAllProducts();
          },
        ),
        BlocProvider(
          create: (context) {
            return CategoriesCubit(ProductsRepoImpl(ApiService()))
              ..fetchCategories();
          },
        ),
        BlocProvider(
          create: (context) {
            return ProfileCubit(ProfileRepoImpl());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Constants.kPoppins,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: AppColors.primaryColor),
          ),
          scaffoldBackgroundColor: AppColors.greyF4,
        ),

        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppRoutes.navbar,
        // initialRoute: AppRoutes.login,
        // initialRoute: AppRoutes.signup,
        // initialRoute: AppRoutes.home,
        // initialRoute: AppRoutes.account,
        // initialRoute: AppRoutes.aboutMe,
        // initialRoute: AppRoutes.productsCategories,
      ),
    );
  }
}
