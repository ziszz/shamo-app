import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/cart_page.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class ProductDetailPage extends StatefulWidget {
  static const routeName = "/product-detail";

  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _gallery(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      backgroundColor: AppColors.lightWhite,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.black1,
          size: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
          icon: Image.asset(
            "assets/ic-cart-black.png",
            width: 20,
          ),
        ),
      ],
    );
  }

  Widget _gallery() {
    final images = [
      "assets/product-example.png",
      "assets/product-example.png",
      "assets/product-example.png",
    ];

    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 225,
            onPageChanged: (index, reason) {
              setState(() {
                _carouselIndex = index;
              });
            },
          ),
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return Image.asset(
              images[index],
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
        ),
        Container(
          height: 50,
          alignment: Alignment.topCenter,
          color: AppColors.lightWhite,
          child: DotsIndicator(
            decorator: DotsDecorator(
              color: AppColors.grey,
              activeColor: AppColors.purple,
              size: const Size(4, 4),
              activeSize: const Size(16, 4),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              spacing: const EdgeInsets.all(2),
            ),
            dotsCount: images.length,
            position: _carouselIndex.toDouble(),
          ),
        ),
      ],
    );
  }
}
