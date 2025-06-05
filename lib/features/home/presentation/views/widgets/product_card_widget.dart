import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductCardWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetails,
            arguments: productModel);
      },
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(Icons.favorite_border, color: AppColors.grey86),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    productModel.image,
                    fit: BoxFit.cover,
                    width: 84,
                    height: 84,
                    errorBuilder: (context, error, stackTrace) => ClipOval(
                      child: Image.network(
                        'https://btech.com/media/catalog/product/cache/4709f4e5925590e2003d78a7a1e77edb/b/d/bddcd22b45aa0a229167c454a79d5afdc01e6f1a0d6f71a63f541d07f72f33fa.jpeg',
                        fit: BoxFit.cover,
                        width: 84,
                        height: 84,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${productModel.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.customColor,
                  ),
                ),
      
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(productModel.name, style: AppStyles.semiBold14),
                ),
                Divider(height: 24, color: AppColors.greyE6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    const Icon(
                      Icons.shopping_bag_outlined,
                      size: 15,
                      color: AppColors.customColor,
                    ),
                    Text(
                      'Add to cart',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
