import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckboxWidget extends StatelessWidget {
  final ValueChanged<bool> onChecked;
  final bool isTermsAccepted;
  const CheckboxWidget({
    super.key,
    required this.onChecked,
    required this.isTermsAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isTermsAccepted);
      },
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: isTermsAccepted
              ? AppColors.primaryColor
              : AppColors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isTermsAccepted
                  ? AppColors.primaryColor
                  : AppColors.greyDC,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: SvgPicture.asset(AppImages.check),
      ),
    );
  }
}
