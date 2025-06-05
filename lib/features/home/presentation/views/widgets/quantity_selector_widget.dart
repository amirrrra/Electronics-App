import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuantitySelectorWidget extends StatelessWidget {
  const QuantitySelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyE6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {},
          ),
          const Text('3'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

