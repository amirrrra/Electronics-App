import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final List<String> categoriesNames;
  const CategoryWidget({super.key, required this.categoriesNames});

  @override
  Widget build(BuildContext context) {
    List<IconData> categoriesIcons = [
      Icons.computer,
      Icons.smartphone,
      Icons.mic,
      Icons.devices,
      Icons.tablet_mac,
      Icons.tv,
      Icons.camera_alt,
      Icons.watch,
    ];
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 80,
            child: ListView.separated(
              itemCount: categoriesNames.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemBuilder: (context, index) {
                final categoryIcon = categoriesIcons[index];
                final categoryName = categoriesNames[index];
                return Column(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffF3EFFA),
                      radius: 25,
                      child: Icon(
                        categoryIcon,
                        color: AppColors.primaryColor,
                        size: 24,
                      ),
                    ),
                    Text(
                      categoryName,
                      style: TextStyle(color: Color(0xff868889), fontSize: 10),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
