import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/checkbox_widget.dart';
import 'package:flutter/material.dart';

class ConditionWidget extends StatelessWidget {
  final ValueChanged<bool> onChecked;
  final bool isTermsAccepted;
  const ConditionWidget({
    super.key,
    required this.onChecked,
    required this.isTermsAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckboxWidget(
          onChecked: onChecked,
          isTermsAccepted: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: AppStyles.semiBold14.copyWith(
                    color: AppColors.grey94,
                  ),
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: AppStyles.semiBold14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
