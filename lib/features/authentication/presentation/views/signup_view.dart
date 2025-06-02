import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/signup_widget.dart';
import 'package:flutter/material.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SignupWidget(),
    );
  }
}
