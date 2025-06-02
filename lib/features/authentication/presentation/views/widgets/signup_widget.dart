import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:  Constants.horizPadding20,
          child: Column(
            children: [
              const AppBarWidget(title: 'Sign Up', isBack: false),             
            ],
          ),
        ),
      ),
    );
  }
}
