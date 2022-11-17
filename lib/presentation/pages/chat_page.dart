import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/chat_detail_page.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Message Support",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.white,
              fontWeight: medium,
              fontSize: 18,
            ),
      ),
      centerTitle: true,
    );
  }
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return _chatList();
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

  Widget _chatList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Navigator.pushNamed(
            context,
            ChatDetailPage.routeName,
          ),
          leading: Image.asset(
            "assets/default-shop-profile.png",
          ),
          title: Text(
            "Shoes Store",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.white,
                ),
          ),
          subtitle: Text(
            "Good night, This item is on...",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: AppColors.grey,
                  fontWeight: light,
                ),
          ),
          trailing: Text(
            "Now",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.overline?.copyWith(
                  color: AppColors.grey,
                  letterSpacing: 0,
                ),
          ),
        );
      },
    );
  }
}
