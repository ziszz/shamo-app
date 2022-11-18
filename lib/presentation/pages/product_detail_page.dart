import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/cart_page.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = "/product-detail";

  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      backgroundColor: AppColors.white,
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
}
