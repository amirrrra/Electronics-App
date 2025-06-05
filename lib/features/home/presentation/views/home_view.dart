import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/category_builder_widget.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/products_builder_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Constants.horizPadding20,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 32,
                  children: [
                    // CarouselWidget(),
                    CategoryBuilderWidget(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Featured products",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ProductsBuilderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
