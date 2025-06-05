import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/features/home/presentation/cubits/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({super.key});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).fetchAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  'https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_1280.jpg',
                  fit: BoxFit.cover,
                  width: 84,
                  height: 84,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$8.00',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),

              Text('Fresh Peach', style: AppStyles.bold16),
              Divider(height: 24, color: AppColors.greyE6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 15,
                    color: AppColors.primaryColor,
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
    );
  }
}
