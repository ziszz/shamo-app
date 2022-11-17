import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class CartPage extends StatelessWidget {
  static const routeName = "/cart";

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black3,
      appBar: _appBar(context: context),
      body: SafeArea(
        child: _emptyContent(context: context),
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
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
              style: Theme.of(context).textTheme.button?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
