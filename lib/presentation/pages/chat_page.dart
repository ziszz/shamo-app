import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Chat Page"),
    );
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
}
