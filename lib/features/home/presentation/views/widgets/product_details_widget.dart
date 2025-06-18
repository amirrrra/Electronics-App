import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'addtocart_button_widget.dart';
import 'product_details_image_widget.dart';
import 'quantity_selector_widget.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductDetailsImageWidget(productModel: product,),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.greyF9,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${product.price}', style: AppStyles.bold18),
                    const Icon(Icons.favorite_border),
                  ],
                ),
                Text(product.name, style: AppStyles.bold20),
                Row(
                  spacing: 4,
                  children: [
                    const Text(
                      '4.5',
                      style: AppStyles.bold,
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_half,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ),
                    Text(
                      '(89 reviews)',
                      style: TextStyle(color: AppColors.grey86),
                    ),
                  ],
                ),
                Text(
                  product.description,
                  style: TextStyle(color: AppColors.grey86),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 12,
                  children: [
                    QuantitySelectorWidget(),
                    Expanded(child: AddToCartButtonWidget()),
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
