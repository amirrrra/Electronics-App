import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsGridWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
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
    );
  }
}
