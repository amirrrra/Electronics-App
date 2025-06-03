import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/signin_widget.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SigninWidget(),
    );
  }
}
