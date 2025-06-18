import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/features/profile/presentation/widgets/logout_listener_widget.dart';
import 'package:flutter/material.dart';
import 'profile_image_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Container(height: 130, color: AppColors.white),
            const SizedBox(height: 50 + 8),
            Text('Olivia Austin', style: AppStyles.semiBold15),
            Text(
              'oliviaaustin@gmail.com',
              style: AppStyles.regular12.copyWith(color: AppColors.grey86),
            ),
            SizedBox(height: 12),
            LogoutListenerWidget(),
          ],
        ),

        ProfileImageWidget(),
      ],
    );
  }
}
