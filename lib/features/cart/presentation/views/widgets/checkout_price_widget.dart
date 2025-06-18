import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CheckoutPriceWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool flag;
  const CheckoutPriceWidget({
    super.key,
    required this.title,
    required this.value,
    this.flag = true,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = flag
        ? AppStyles.medium12.copyWith(color: AppColors.grey86)
        : AppStyles.semiBold18;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textStyle),
        Text(value, style: textStyle),
      ],
    );
  }
}
