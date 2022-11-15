import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      toolbarHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        title: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Alex",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: semiBold,
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    "@alexkeinn",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: regular,
                          color: AppColors.grey,
                        ),
                  ),
                ],
              ),
              Image.asset(
                "assets/default-user-profile.png",
                width: 54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
