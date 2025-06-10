import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_images.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool isBack;
  final Color color;
  const AppBarWidget({super.key, required this.title, this.isBack = true,  this.color=AppColors.white,});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all( 28),
      decoration: BoxDecoration(color: color),
      child: SafeArea(
        child: Row(
          children: [
            // Back Button
            isBack
                ? GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(AppImages.arrowBack),
                )
                : const SizedBox(width: 18, height: 18),
            Spacer(),
        
            // Title
            Text(title, style: AppStyles.semiBold18),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
