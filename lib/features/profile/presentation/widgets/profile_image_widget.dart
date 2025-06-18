import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130 - 50,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://i.ytimg.com/vi/o_7JwvsF-lc/hqdefault.jpg'),
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
