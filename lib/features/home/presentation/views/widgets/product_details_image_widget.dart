import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailsImageWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                productModel.image,
                width: 200,
                height: 180,
                fit: BoxFit.contain,
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
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 16),
            child: Icon(Icons.arrow_back, size: 28),
          ),
        ),
      ],
    );
  }
}
