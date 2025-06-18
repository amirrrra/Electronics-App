import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/core/widgets/app_bar_widget.dart';
import 'package:electronics_app/features/cart/presentation/views/widgets/checkout_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/cart_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF4,
      body: Column(
        spacing: 26,
        children: [
          AppBarWidget(title: 'Cart'),

          Padding(
            padding: Constants.horizPadding16,
            child: Column(
              spacing: 32,
              children: [CartWidget(), CheckoutWidget()],
            ),
          ),
        ],
      ),
    );
  }
}
