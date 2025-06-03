import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/core/widgets/button_widget.dart';
import 'package:electronics_app/core/widgets/textfield_widget.dart';
import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/condition_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/password_field_widget.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final _key = GlobalKey<FormState>();
  bool isTermsAccepted = false;

  String fname = '',
      lname = '',
      phone = '',
      address = '',
      email = '',
      password = '',
      confirmPassword = '';

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
                TextfieldWidget(
                  hint: 'First Name',
                  onSaved: (value) {
                    fname = value!;
                  },
                ),
                TextfieldWidget(
                  hint: 'Last Name',
                  onSaved: (value) {
                    lname = value!;
                  },
                ),
                TextfieldWidget(
                  hint: 'Email',
                  onSaved: (value) {
                    email = value!;
                  },
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    return !emailRegex.hasMatch(value!)
                        ? 'Enter a valid email'
                        : null;
                  },
                ),
                TextfieldWidget(
                  hint: 'Address',
                  onSaved: (value) {
                    address = value!;
                  },
                ),
                TextfieldWidget(
                  hint: 'Phone Number',
                  textInputType: TextInputType.phone,
                  onSaved: (value) {
                    phone = value!;
                  },
                ),
                PasswordFieldWidget(
                  hint: 'Password',
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                PasswordFieldWidget(
                  hint: 'Confirm Password',
                  onSaved: (value) {
                    confirmPassword = value!;
                  },
                ),
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
                  child: ButtonWidget(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();
                        var userModel = UserModel(
                          firstName: fname,
                          lastName: lname,
                          phone: phone,
                          address: address,
                          email: email,
                          password: password,
                        );

                        BlocProvider.of<AuthCubit>(
                          context,
                        ).signup(userModel: userModel);
                      }
                    },
                  ),
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
