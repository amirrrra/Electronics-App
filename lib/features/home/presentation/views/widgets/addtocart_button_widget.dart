import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddToCartButtonWidget extends StatelessWidget {
  const AddToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: const [
          Text(
            'Add to cart',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.shopping_bag_outlined, color: AppColors.white),
        ],
      ),
    );
  }
}
