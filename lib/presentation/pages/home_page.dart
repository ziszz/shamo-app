import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/presentation/pages/product_detail_page.dart';
import 'package:shamo_app/presentation/widgets/center_progress_bar.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();

  static AppBar appBar({required BuildContext context, required User user}) {
    return AppBar(
      toolbarHeight: 87,
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
                    "Hello, ${user.name}",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: Constants.semiBold,
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    "@${user.username}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: Constants.regular,
                          color: AppColors.grey,
                        ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: user.profilePhotoUrl,
                  width: 50,
                  placeholder: (context, url) => const CenterProgressBar(),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/default-user-profile.png",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Column(children: [
        TabBar(
          indicatorWeight: 0,
          indicator: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          unselectedLabelStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: Constants.light,
                  ),
          padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
          splashBorderRadius: BorderRadius.circular(12),
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          tabs: [
            _tabItem(text: "Tab 1"),
            _tabItem(text: "Tab 2"),
            _tabItem(text: "Tab 3"),
            _tabItem(text: "Tab 4"),
            _tabItem(text: "Tab 5"),
            _tabItem(text: "Tab 6"),
          ],
        ),
        Expanded(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              _allProduct(context: context),
              ...List.generate(
                5,
                (index) => _productByCategory(context: context),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _tabItem({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.black2,
        ),
      ),
      child: Tab(text: text),
    );
  }

  Widget _productCard({
    required BuildContext context,
    required String image,
    required String category,
    required String name,
    required String price,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailPage.routeName,
      ),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.lightWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Image.asset(
                "assets/images/product-example.png",
                width: 215,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                category,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                    ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.black1,
                      fontWeight: Constants.semiBold,
                    ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: Constants.medium,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productTile({
    required BuildContext context,
    required String image,
    required String category,
    required String name,
    required String price,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailPage.routeName,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 120,
              height: 120,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                name,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: Constants.semiBold,
                    ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: Constants.medium,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _allProduct({required BuildContext context}) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 22),
            child: Text(
              "Popular Product",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: Constants.semiBold,
                  ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(
                width: 30,
              ),
              itemBuilder: (context, index) {
                return _productCard(
                  context: context,
                  image: "assets/images/product-example.png",
                  category: "Football",
                  name: "Predator 20.3 Firm Ground",
                  price: "\$68,47",
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Text(
              "New Arrival",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: Constants.semiBold,
                  ),
            ),
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemBuilder: (context, index) {
              return _productTile(
                context: context,
                image: "assets/images/product-example.png",
                category: "Football",
                name: "Predator 20.3 Firm Ground",
                price: "\$68,47",
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _productByCategory({required BuildContext context}) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Text(
              "For you",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: Constants.semiBold,
                  ),
            ),
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemBuilder: (context, index) {
              return _productTile(
                context: context,
                image: "assets/images/product-example.png",
                category: "Football",
                name: "Predator 20.3 Firm Ground",
                price: "\$68,47",
              );
            },
          ),
        ],
      ),
    );
  }
}
