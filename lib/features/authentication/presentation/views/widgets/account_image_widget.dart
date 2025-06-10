import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AccountImageWidget extends StatelessWidget {
  const AccountImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130 - 50,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: CircleAvatar(
              backgroundColor: AppColors.customColor,
              radius: 14,
              child: Icon(Icons.camera_alt, size: 16, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
