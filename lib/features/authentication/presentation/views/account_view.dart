import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/authentication/presentation/views/widgets/account_widget.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

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
