import 'package:electronics_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/app_styles.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkout_price_widget.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
   final cartItems = context.watch<CartCubit>().state;

    var shippingCharges = 1.6;
    var subTotal = cartItems.fold(0.0, (previousValue, element) => previousValue + element.price);
    var total = subTotal + shippingCharges;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: AppColors.white,
      child: Column(
        children: [
          CheckoutPriceWidget(title: 'Subtotal', value: '\$${subTotal.toStringAsFixed(2)}'),
          const SizedBox(height: 6),
          CheckoutPriceWidget(title: 'Shipping charges', value: '\$$shippingCharges'),
          const Divider(height: 40, thickness: 1),
          CheckoutPriceWidget(title: 'Total', value: '\$${total.toStringAsFixed(2)}', flag: false),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: Constants.borderRadius5,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout',
                style: AppStyles.semiBold15.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
