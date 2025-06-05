import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/home/data/category_model.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoriesItems = [
      CategoryModel(iconData: Icons.computer, name: 'Computers'),
      CategoryModel(iconData: Icons.smartphone, name: 'Mobiles'),
      CategoryModel(iconData: Icons.mic, name: 'Audio'),
      CategoryModel(iconData: Icons.tablet_mac, name: 'Tablets'),
      CategoryModel(iconData: Icons.tv, name: 'TVs'),
      CategoryModel(iconData: Icons.camera_alt, name: 'Cameras'),
      CategoryModel(iconData: Icons.watch, name: 'Wearables'),
      CategoryModel(iconData: Icons.devices, name: 'Accessories'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          "Categories",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: categoriesItems.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemBuilder: (context, index) {
              final category = categoriesItems[index];
              return Column(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffF3EFFA),
                    radius: 25,
                    child: Icon(
                      category.iconData,
                      color: AppColors.primaryColor,
                      size: 24,
                    ),
                  ),
                  Text(
                    category.name,
                    style: TextStyle(color: Color(0xff868889), fontSize: 10),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
