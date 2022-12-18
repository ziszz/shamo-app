import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/cart_page.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import '../../../core/lib/utilities/app_colors.dart';
import '../../../core/lib/utilities/constants.dart';

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
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .60,
              color: AppColors.lightWhite,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .40,
              color: AppColors.black1,
            ),
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar(context: context),
          bottomNavigationBar: _bottomAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _gallery(),
                  _details(context: context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      surfaceTintColor: AppColors.lightWhite,
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
            "assets/images/ic-cart-black.png",
            width: 20,
          ),
        ),
      ],
    );
  }

  Widget _bottomAppBar() {
    return SizedBox(
      height: 80,
      child: BottomAppBar(
        color: AppColors.black1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.purple,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/images/ic-message.png",
                    ),
                    color: AppColors.purple,
                  ),
                ),
              ),
              FilledButton(
                width: 245,
                onPressed: () {},
                child: Text(
                  "Add to Cart",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gallery() {
    final images = [
      "assets/images/product-example.png",
      "assets/images/product-example.png",
      "assets/images/product-example.png",
    ];

    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 215,
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
        DotsIndicator(
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
      ],
    );
  }

  Widget _details({required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: AppColors.black1,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terrex Urban Low".toUpperCase(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: Constants.semiBold,
                          ),
                    ),
                    Text(
                      "Hiking",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundColor: AppColors.black6,
                    child: ImageIcon(
                      AssetImage(
                        "assets/images/ic-favorite.png",
                      ),
                      size: 20,
                      color: AppColors.black1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price starts from",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: Constants.regular,
                      ),
                ),
                Text(
                  "\$143,98",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.blue,
                        fontWeight: Constants.semiBold,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Familiar Shoes",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 54,
            child: ListView.separated(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      "assets/images/product-example.png",
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
