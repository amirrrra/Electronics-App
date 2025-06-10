import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonWidget({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 54),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: Constants.borderRadius5),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppStyles.bold16.copyWith(color: Colors.white)),
    );
  }
}
