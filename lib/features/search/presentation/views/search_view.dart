import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/search_field_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [SizedBox(height: 14), SearchFieldWidget()]),
        ),
      ),
    );
  }
}
