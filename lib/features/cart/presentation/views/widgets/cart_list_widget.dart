import 'package:flutter/material.dart';
import 'cart_widget.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return const CartWidget();
      },
    );
  }
}
