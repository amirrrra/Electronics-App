import 'package:electronics_app/core/helpers/show_snackbar.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final ProductModel product;
  const AddToCartButtonWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var cartCubit = context.read<CartCubit>();
        bool isAlreadyInCart = cartCubit.state.any(
          (item) => item.id == product.id,
        );
        if (isAlreadyInCart) {
          showSnackbarHelper(
            context: context,
            message: 'Item is already in cart',
          );
        } else {
          cartCubit.addToCart(product);
          showSnackbarHelper(context: context, message: 'Item added to cart');
        }
      },
      child: Container(
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
      ),
    );
  }
}
