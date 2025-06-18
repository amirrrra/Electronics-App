import 'package:electronics_app/core/utils/app_routes.dart';
import 'package:electronics_app/core/utils/constants.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/category_builder_widget.dart';
import 'package:electronics_app/features/home/presentation/views/widgets/products_builder_widget.dart';
import 'package:electronics_app/features/search/presentation/views/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/carousel_widget.dart';

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
                  spacing: 16,
                  children: [
                    const SizedBox(),
                    SearchFieldWidget(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.search),
                    ),
                    CarouselWidget(),
                    const SizedBox(height: 8),
                    CategoryBuilderWidget(),
                    const SizedBox(height: 8),
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
