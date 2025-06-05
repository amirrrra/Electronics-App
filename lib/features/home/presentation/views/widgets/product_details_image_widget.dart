import 'package:flutter/material.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget({super.key});

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
                'https://cdn.pixabay.com/photo/2017/01/11/10/25/headsets-1971383_1280.jpg',
                width: 200,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 16),
          child: Icon(Icons.arrow_back, size: 28),
        ),
      ],
    );
  }
}
