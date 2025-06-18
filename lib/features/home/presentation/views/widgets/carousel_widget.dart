import 'package:electronics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2017/01/11/10/25/headsets-1971383_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_1280.jpg',
    'https://cdn.pixabay.com/photo/2022/07/14/04/58/camera-7320445_1280.jpg',
    'https://cdn.pixabay.com/photo/2021/11/03/05/33/fitness-band-6764739_1280.jpg',
    'https://cdn.pixabay.com/photo/2022/10/14/08/03/earbuds-7520738_1280.jpg',
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 16,
        children: [
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() => activeIndex = index);
              },
            ),
            itemBuilder: (context, index, realIndex) {
              final imageUrl = imageUrls[index];
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              );
            },
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imageUrls.length,
            effect: WormEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: AppColors.primaryColor,
              dotColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
