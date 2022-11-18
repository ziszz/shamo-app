import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/checkout_page.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class CartPage extends StatefulWidget {
  static const routeName = "/cart";

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black3,
      bottomNavigationBar: _bottomAppBar(),
      appBar: _appBar(context: context),
      body: SafeArea(
        child: _listProduct(),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        splashColor: Colors.transparent,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.white,
          size: 20,
        ),
      ),
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Your Cart",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.white,
              fontWeight: medium,
              fontSize: 18,
            ),
      ),
    );
  }

  Widget _bottomAppBar() {
    return SizedBox(
      height: 145,
      child: BottomAppBar(
        color: AppColors.black3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    "\$287,96",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blue,
                          fontWeight: semiBold,
                        ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: AppColors.black2,
                  thickness: 1,
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  CheckoutPage.routeName,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Continue to Checkout",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.white,
                            fontWeight: semiBold,
                          ),
                    ),
                    Transform.rotate(
                      angle: math.pi,
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyContent({required BuildContext context}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/ic-trolly.png",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Opss! Your cart is Empty",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.white,
                  fontWeight: medium,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Let's find your favorite shoes",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton(
            width: 152,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              MainPage.routeName,
              (route) => false,
            ),
            child: Text(
              "Explore Store",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productTile({
    required BuildContext context,
    required String imagePath,
    required String name,
    required double price,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 60,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: semiBold,
                        ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blue,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.purple,
                      radius: 8,
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      _quantity.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.white,
                            fontWeight: medium,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_quantity > 0) _quantity--;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.black6,
                      radius: 8,
                      child: Icon(
                        Icons.remove,
                        color: AppColors.white,
                        size: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage(
                    "assets/ic-trash.png",
                  ),
                  color: AppColors.red,
                  size: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Remove",
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: AppColors.red,
                        fontWeight: light,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listProduct() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 1,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        return _productTile(
          context: context,
          imagePath: "assets/product-example.png",
          name: "Terrex Urban Low",
          price: 143.98,
        );
      },
    );
  }
}
