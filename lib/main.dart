import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'core/utils/constants.dart';

void main() {
  runApp(const ElectronicsApp());
}

class ElectronicsApp extends StatelessWidget {
  const ElectronicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Constants.kPoppins,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.primaryColor),
        ),
      ),

      onGenerateRoute: AppRoutes.onGenerateRoute,
      // initialRoute: AppRoutes.login,
      initialRoute: AppRoutes.home,
    );
  }
}
