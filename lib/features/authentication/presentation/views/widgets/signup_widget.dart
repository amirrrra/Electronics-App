import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/core/widgets/button_widget.dart';
import 'package:electronics_app/core/widgets/textfield_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/condition_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/password_field_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/switch_widget.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final _key = GlobalKey<FormState>();
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: Constants.horizPadding20,
          child: Form(
            key: _key,
            child: Column(
              spacing: 16,
              children: [
                const AppBarWidget(title: 'Sign Up', isBack: false),
                TextfieldWidget(hint: 'First Name'),
                TextfieldWidget(hint: 'Last Name'),
                TextfieldWidget(
                  hint: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                TextfieldWidget(hint: 'Address'),
                TextfieldWidget(
                  hint: 'Phone Number',
                  textInputType: TextInputType.phone,
                ),
                PasswordFieldWidget(hint: 'Password'),
                PasswordFieldWidget(hint: 'Confirm Password'),
                ConditionWidget(
                  onChecked: (value) {
                    setState(() {
                      isTermsAccepted = value;
                    });
                  },
                  isTermsAccepted: isTermsAccepted,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ButtonWidget(text: 'Sign Up'),
                ),
                SwitchWidget(
                  qText: 'Already have an account',
                  text: 'Log In',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
