import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_outlined,
            size: 100,
            color: AppColors.primaryColor,
          ),
          const Text('No results found', style: TextStyle(fontSize: 16)),
          const Text('Try different keywords', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
