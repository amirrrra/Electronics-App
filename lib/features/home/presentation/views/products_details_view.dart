import 'package:electronics_app/features/home/presentation/views/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';

class ProductsDetailsView extends StatelessWidget {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: ProductDetailsWidget(),
        ),
      ),
    );
  }
}
