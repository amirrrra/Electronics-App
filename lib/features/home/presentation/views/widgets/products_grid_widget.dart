import 'package:electronics_app/features/home/presentation/views/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 20,
        childAspectRatio: 180 / 224
      ),
      itemBuilder: (context, index) {
        return const ProductCardWidget();
      },
    );
  }
}
