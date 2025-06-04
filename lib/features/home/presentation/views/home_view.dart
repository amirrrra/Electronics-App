import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Constants.horizPadding20,
          child: Column(
            spacing: 16,
            children: [
             CarouselWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
