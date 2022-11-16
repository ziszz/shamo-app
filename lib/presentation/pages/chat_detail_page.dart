import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_textfield.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

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
        child: SingleChildScrollView(
          child: Column(),
        ),
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
            imagePath: "assets/default-shop-profile.png",
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
    );
  }

  Widget _productPreview({
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
              "assets/product-example.png",
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
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: AppColors.white,
                      ),
                ),
                Text(
                  "\$${price.toString()}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: AppColors.blue,
                        fontWeight: medium,
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
              "assets/ic-close.png",
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
              _productPreview(
                  context: context,
                  imagePath: "assets/product-preview.png",
                  name: "Terrex Urban Low",
                  price: 57.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: FilledTextField(
                      height: 45,
                      fillColor: AppColors.black1,
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
                        "assets/ic-send.png",
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
