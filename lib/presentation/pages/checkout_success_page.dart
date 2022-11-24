import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class CheckoutSuccessPage extends StatelessWidget {
  static const routeName = "/checkout-success";

  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black3,
      appBar: _appBar(context: context),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic-trolly.png"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You made a transaction",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: Constants.medium,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Stay at home while we\nprepare your dream shoes",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              FilledButton(
                width: 196,
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainPage.routeName,
                  (route) => false,
                ),
                child: Text(
                  "Order Other Shoes",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              FilledButton(
                width: 196,
                fillColor: AppColors.black2,
                onPressed: () {},
                child: Text(
                  "View My Order",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Checkout Success",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
              fontWeight: Constants.medium,
              fontSize: 18,
            ),
      ),
    );
  }
}
