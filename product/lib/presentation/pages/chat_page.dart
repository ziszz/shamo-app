import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:product/presentation/pages/chat_detail_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Message Support",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
              fontWeight: Constants.medium,
              fontSize: 18,
            ),
      ),
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
          "assets/images/ic-headset.png",
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Opss no message yet?",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontWeight: Constants.medium,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "You have never done a transaction",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
          ),
        ),
      ],
    );
  }

  Widget _chatTile({
    required String imagePath,
    required String name,
    required String message,
    required String time,
  }) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        ChatDetailPage.routeName,
      ),
      leading: Image.asset(
        imagePath,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
            ),
      ),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.grey,
              fontWeight: Constants.light,
            ),
      ),
      trailing: Text(
        time,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.grey,
              letterSpacing: 0,
            ),
      ),
    );
  }

  Widget _chatList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 1,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        return _chatTile(
          imagePath: "assets/images/default-shop-profile.png",
          name: "Shoes Store",
          message: "Good night, This item is on...",
          time: "Now",
        );
      },
    );
  }
}
