import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final ProductModel product;
  const CartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: AppColors.red,
        child: const Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {},
      child: Container(
        color: AppColors.white,
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
                errorBuilder: (context, error, stackTrace) => ClipOval(
                  child: Image.network(
                    'https://btech.com/media/catalog/product/cache/4709f4e5925590e2003d78a7a1e77edb/b/d/bddcd22b45aa0a229167c454a79d5afdc01e6f1a0d6f71a63f541d07f72f33fa.jpeg',
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${product.price} x 5',
                    style: AppStyles.medium12.copyWith(
                      color: AppColors.customColor,
                    ),
                  ),
                  Text(product.name, style: AppStyles.semiBold15),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                    color: AppColors.customColor,
                  ),
                ),
                Text(
                  '5',
                  style: AppStyles.medium15.copyWith(color: AppColors.grey86),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                    color: AppColors.customColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
