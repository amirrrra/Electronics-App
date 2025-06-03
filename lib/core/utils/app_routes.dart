import 'package:electronics_app/features/authentication/presentation/views/signin_view.dart';
import 'package:electronics_app/features/authentication/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const SigninView());
      case signup:
        return MaterialPageRoute(builder: (context) => const SignupView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
