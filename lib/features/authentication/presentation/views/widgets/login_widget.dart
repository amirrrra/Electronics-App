import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/core/widgets/button_widget.dart';
import 'package:electronics_app/core/widgets/textfield_widget.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/forgot_password_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/password_field_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email = '', password = '';
  final _key = GlobalKey<FormState>();
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
                const AppBarWidget(title: 'Login', isBack: false),
                TextfieldWidget(
                  hint: 'Email',
                  textInputType: TextInputType.emailAddress,
                  onSaved: (value) {
                    email = value!;
                  },

                ),
                PasswordFieldWidget(
                  hint: 'Password',
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const ForgotPasswordWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ButtonWidget(
                    text: 'Login',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();
                        BlocProvider.of<AuthCubit>(
                          context,
                        ).login(email: email, password: password);
                      }
                    },
                  ),
                ),
                SwitchWidget(
                  qText: 'Don\'t have an account',
                  text: 'Sign up',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.signup),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
