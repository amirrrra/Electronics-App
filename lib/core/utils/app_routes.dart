import 'package:electronics_app/features/authentication/presentation/views/login_view.dart';
import 'package:electronics_app/features/authentication/presentation/views/signup_view.dart';
import 'package:electronics_app/features/home/home_view.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static const String home = 'home';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signup:
        return MaterialPageRoute(builder: (context) =>  SignupView());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
