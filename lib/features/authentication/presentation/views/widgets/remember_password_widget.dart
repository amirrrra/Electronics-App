import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class RememberPasswordWidget extends StatelessWidget {
  const RememberPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var inactiveBorder = Border.all(color: AppColors.grey86, width: 1.5);
    return Row(
      spacing: 10,
      children: [
        FlutterSwitch(
          width: 28,
          height: 16,
          toggleSize: 14,
          value: false,
          // value: true,
          padding: 0,
          activeColor: AppColors.customColor,
          inactiveColor: AppColors.transparent,
          inactiveSwitchBorder: inactiveBorder,
          inactiveToggleBorder: inactiveBorder,
          activeToggleBorder: Border.all(
            color: AppColors.customColor,
            width: 1.5,
          ),
          inactiveToggleColor: AppColors.white,
          onToggle: (val) {},
        ),

        Text(
          "Remember Me",
          style: AppStyles.medium15.copyWith(color: AppColors.grey86),
        ),
      ],
    );
  }
}
