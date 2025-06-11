import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets/about_me_builder_widget.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF4,
      body: AboutMeBuilderWidget(),
    );
  }
}
