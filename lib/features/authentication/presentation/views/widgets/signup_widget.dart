import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/core/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                const AppBarWidget(title: 'Sign Up', isBack: false),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(child: TextfieldWidget(hint: 'First Name')),
                    Expanded(child: TextfieldWidget(hint: 'Last Name')),
                  ],
                ),
                TextfieldWidget(
                  hint: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                TextfieldWidget(
                  hint: 'Phone Number',
                  textInputType: TextInputType.phone,
                ),
                TextfieldWidget(hint: 'Password', obscureText: true),
                TextfieldWidget(hint: 'Confirm Password', obscureText: true),
                TextfieldWidget(hint: 'Address'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
