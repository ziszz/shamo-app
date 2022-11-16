import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class ChatDetailPage extends StatelessWidget {
  static const routeName = "/chat-detail";

  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      leading: IconButton(
        splashColor: Colors.transparent,
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.white,
          size: 20,
        ),
      ),
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Row(
        children: [
          Image.asset(
            "assets/default-shop-profile.png",
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shoes Shop",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.white,
                      fontWeight: medium,
                    ),
              ),
              Text(
                "Online",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.grey,
                      fontWeight: light,
                    ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
