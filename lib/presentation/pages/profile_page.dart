import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Page"),
    );
  }

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black1,
      toolbarHeight: 125,
      titleSpacing: 30,
      title: Row(
        children: [
          Image.asset(
            "assets/default-user-profile.png",
            width: 64,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Alex",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: semiBold,
                      color: AppColors.white,
                    ),
              ),
              Text(
                "@alexkeinn",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: regular,
                      color: AppColors.grey,
                    ),
              ),
            ],
          ),
          const Spacer(),
          const ImageIcon(
            AssetImage("assets/ic-logout.png"),
            size: 20,
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
}
