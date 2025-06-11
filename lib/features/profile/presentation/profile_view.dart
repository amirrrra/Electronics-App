import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/profile/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.greyF4,
      body: SafeArea(
        child: AccountWidget(),
      ),
    );
  }
}
