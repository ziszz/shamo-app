import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/presentation/widgets/filled_textfield.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class ChatDetailPage extends StatelessWidget {
  static const routeName = "/chat-detail";

  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black3,
      appBar: _appBar(context: context),
      bottomNavigationBar: _messageInput(context: context),
      body: SafeArea(
        child: _messageList(context: context),
      ),
    );
  }

  Widget _imageBadge({required String imagePath}) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(
          imagePath,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 3,
              color: AppColors.black1,
            ),
          ),
        ),
      ],
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
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
      title: Row(
        children: [
          _imageBadge(
            imagePath: "assets/images/default-shop-profile.png",
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shoes Shop",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: Constants.medium,
                    ),
              ),
              Text(
                "Online",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                      fontWeight: Constants.light,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productPreviewCard({
    required BuildContext context,
    required String imagePath,
    required String name,
    required double price,
  }) {
    return Container(
      width: 240,
      height: 155,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightPurple,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/product-example.png",
                  width: 70,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Text(
                      "\$$price",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.blue,
                            fontWeight: Constants.medium,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: AppColors.purple,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add to cart",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.purple,
                      ),
                ),
              ),
              FilledButton(
                width: 100,
                height: 41,
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.black1,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _messageBubble({
    required BuildContext context,
    required String text,
    required bool isMyChat,
  }) {
    return Column(
      crossAxisAlignment:
          isMyChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          width: 240,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: isMyChat ? AppColors.lightPurple : AppColors.black4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Now",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.grey,
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _messageList({required BuildContext context}) {
    final position = [true, false];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: _productPreviewCard(
              context: context,
              imagePath: "assets/images/product-preview.png",
              name: "Terrex Urban Low",
              price: 57.15,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            itemBuilder: (context, index) {
              return _messageBubble(
                context: context,
                text: "Hi, This item is still available?",
                isMyChat: position[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 24);
            },
          ),
        ],
      ),
    );
  }

  Widget _productPreviewTile({
    required BuildContext context,
    required String imagePath,
    required String name,
    required double price,
  }) {
    return Container(
      width: 225,
      height: 74,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.purple.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.purple,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/product-example.png",
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                      ),
                ),
                Text(
                  "\$$price",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.blue,
                        fontWeight: Constants.medium,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
            child: Image.asset(
              "assets/images/ic-close.png",
              width: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageInput({required BuildContext context}) {
    return SizedBox(
      height: 165,
      child: BottomAppBar(
        color: AppColors.black3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _productPreviewTile(
                context: context,
                imagePath: "assets/images/product-preview.png",
                name: "Terrex Urban Low",
                price: 57.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: FilledTextField(
                      height: 45,
                      fillColor: AppColors.black4,
                      hintText: "Type message...",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.purple,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    color: AppColors.white,
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage(
                        "assets/images/ic-send.png",
                      ),
                      size: 19,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
