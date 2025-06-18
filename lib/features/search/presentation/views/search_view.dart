import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/search/presentation/views/widgets/search_builder_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/search_appbar_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(),
            SearchAppbarWidget(),
            Expanded(child: SearchBuilderWidget()),
          ],
        ),
      ),
    );
  }
}
