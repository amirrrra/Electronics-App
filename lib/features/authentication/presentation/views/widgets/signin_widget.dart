import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/core/widgets/button_widget.dart';
import 'package:electronics_app/core/widgets/textfield_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/forgot_password_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/password_field_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/switch_widget.dart';
import 'package:flutter/material.dart';

class SigninWidget extends StatelessWidget {
  const SigninWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: Constants.horizPadding20,
          child: Column(
            spacing: 16,
            children: [
              const AppBarWidget(title: 'Login', isBack: false),
              TextfieldWidget(
                hint: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              PasswordFieldWidget(hint: 'Password'),
              const ForgotPasswordWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ButtonWidget(text: 'Login'),
              ),
              SwitchWidget(
                qText: 'Don\'t have an account',
                text: 'Sign up',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
