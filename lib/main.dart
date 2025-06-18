import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/core/services/prefs_token.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:electronics_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:electronics_app/features/home/data/repos/products_repo_impl.dart';
import 'package:electronics_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:electronics_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:electronics_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/constants.dart';
import 'features/search/presentation/cubits/search_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await getToken();
  runApp(ElectronicsApp(token: token));
}

class ElectronicsApp extends StatelessWidget {
  final String? token;
  const ElectronicsApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AuthCubit(AuthRepoImpl(ApiService()));
          },
        ),
        BlocProvider(
          create: (context) {
            return CartCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return ProductsCubit(ProductsRepoImpl(ApiService()))
              ..fetchAllProducts();
          },
        ),
        BlocProvider(
          create: (context) {
            return SearchCubit(ProductsRepoImpl(ApiService()));
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
          scaffoldBackgroundColor: AppColors.white,
        ),

        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: token == null ? AppRoutes.login : AppRoutes.navbar,
        // initialRoute: AppRoutes.login,
        // initialRoute: AppRoutes.signup,
        // initialRoute: AppRoutes.home,
        // initialRoute: AppRoutes.account,
        // initialRoute: AppRoutes.aboutMe,
        // initialRoute: AppRoutes.productsCategories,
        // initialRoute: AppRoutes.search,
      ),
    );
  }
}
