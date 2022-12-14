import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:product/presentation/pages/product_detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _favoriteList();
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
              fontSize: 18,
              color: AppColors.white,
              fontWeight: Constants.medium,
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
            "assets/images/ic-favorite.png",
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
                  fontWeight: Constants.regular,
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

  Widget _favoriteTile({required BuildContext context}) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailPage.routeName,
      ),
      tileColor: AppColors.black4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          "assets/images/product-example.png",
        ),
      ),
      title: Text(
        "Terrex Urban Low",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontWeight: Constants.semiBold,
            ),
      ),
      subtitle: Text(
        "\$143,98",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.blue,
              fontWeight: Constants.regular,
            ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          radius: 15,
          backgroundColor: AppColors.lightBlue,
          child: ImageIcon(
            AssetImage(
              "assets/images/ic-favorite.png",
            ),
            color: AppColors.white,
            size: 10,
          ),
        ),
      ),
    );
  }

  Widget _favoriteList() {
    return ListView.separated(
      itemCount: 2,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemBuilder: (context, index) {
        return _favoriteTile(context: context);
      },
    );
  }
}
