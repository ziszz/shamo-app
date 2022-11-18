import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _emptyContent(context: context);
  }

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Favorite Shoes",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
            "assets/ic-favorite.png",
            color: AppColors.purple,
          ),
          const SizedBox(
            height: 23,
          ),
          Text(
            "You don't have dream shoes?",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Let's find your favorite shoes",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                  fontWeight: regular,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton(
            width: 152,
            onPressed: () {},
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
}
