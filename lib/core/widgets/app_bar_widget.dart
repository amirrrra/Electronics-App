import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool isBack;
  const AppBarWidget({super.key, required this.title, this.isBack = true,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          // Back Button
          isBack
              ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_rounded, size: 18),
              )
              : const SizedBox(width: 18, height: 18),
          Spacer(),

          // Title
          Text(title, style: AppStyles.bold20),
          Spacer(),
        ],
      ),
    );
  }
}
