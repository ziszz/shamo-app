import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _emptyContent(context: context);
  }

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Message Support",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.white,
              fontWeight: medium,
            ),
      ),
      centerTitle: true,
    );
  }

  Widget _emptyContent({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/ic-headset.png",
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Opss no message yet?",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: AppColors.white,
                fontWeight: medium,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "You have never done a transaction",
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: AppColors.grey,
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
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: AppColors.white,
                ),
          ),
        ),
      ],
    );
  }
}
