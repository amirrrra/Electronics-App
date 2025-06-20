import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/core/widgets/navbar_widget.dart';
import 'package:electronics_app/features/cart/presentation/views/cart_view.dart';
import 'package:electronics_app/features/home/presentation/views/products_category_view.dart';
import 'package:electronics_app/features/profile/presentation/about_me_view.dart';
import 'package:electronics_app/features/profile/presentation/profile_view.dart';
import 'package:electronics_app/features/authentication/presentation/views/login_view.dart';
import 'package:electronics_app/features/authentication/presentation/views/signup_view.dart';
import 'package:electronics_app/features/home/data/repos/products_repo_impl.dart';
import 'package:electronics_app/features/home/presentation/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:electronics_app/features/home/presentation/views/home_view.dart';
import 'package:electronics_app/features/home/presentation/views/products_details_view.dart';
import 'package:electronics_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String aboutMe = 'aboutMe';
  static const String productDetails = 'productDetails';
  static const String productsCategories = 'productsCategories';
  static const String navbar = 'navbar';
  static const String search = 'search';
  static const String cart = 'cart';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case navbar:
        return MaterialPageRoute(builder: (context) => const NavbarWidget());
      case search:
        return MaterialPageRoute(builder: (context) => const SearchView());
      case cart:
        return MaterialPageRoute(builder: (context) => const CartView());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signup:
        return MaterialPageRoute(builder: (context) => SignupView());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case profile:
        return MaterialPageRoute(builder: (context) => ProfileView());
      case aboutMe:
        return MaterialPageRoute(builder: (context) => AboutMeView());
      case productDetails:
        return MaterialPageRoute(
          builder: (context) => const ProductsDetailsView(),
          settings: settings,
        );
      case productsCategories:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CategoryProductsCubit(ProductsRepoImpl(ApiService()))
                  ..fetchCategoryProducts(settings.arguments as String),
            child: const ProductsCategoryView(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
