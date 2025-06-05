import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

import 'product_card_widget.dart';

class ProductsCategoryWidget extends StatelessWidget {
  final List<ProductModel> products;
  final String category;
  const ProductsCategoryWidget({
    super.key,
    required this.products,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Constants.horizPadding20,
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 20,
            childAspectRatio: 180 / 224,
          ),
          itemBuilder: (context, index) {
            return ProductCardWidget(productModel: products[index]);
          },
        ),
      ),
    );
  }
}
