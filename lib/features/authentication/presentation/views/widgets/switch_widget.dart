import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final String qText;
  final String text;
  final void Function()? onTap;
  const SwitchWidget({
    super.key,
    required this.qText,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$qText? ',
            style: AppStyles.semiBold14.copyWith(color: AppColors.grey94),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text,
            style: AppStyles.semiBold14.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
