import 'package:auth/presentation/bloc/auth_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/domain/entities/product.dart';
import 'package:product/presentation/bloc/category/category_bloc.dart';
import 'package:product/presentation/bloc/product/product_bloc.dart';
import 'package:product/presentation/pages/product_detail_page.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 87,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        title: SafeArea(child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${state.user.name}",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: Constants.semiBold,
                              color: AppColors.white,
                            ),
                      ),
                      Text(
                        "@${state.user.username}",
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
                      imageUrl: state.user.profilePhotoUrl,
                      width: 50,
                      placeholder: (context, url) => Image.asset(
                        "assets/images/default-user-profile.png",
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/default-user-profile.png",
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        )),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CategoryBloc>().add(OnFetchCategories());
      context.read<ProductBloc>().add(OnFetchProduct());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          final categories = state.categories.reversed.toList();

          return DefaultTabController(
            initialIndex: 0,
            length: categories.length,
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
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                splashBorderRadius: BorderRadius.circular(12),
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                tabs: categories.map((e) => _tabItem(text: e.name)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: categories
                      .map((e) => _content(categoryId: e.id))
                      .toList(),
                ),
              ),
            ]),
          );
        } else {
          return const SizedBox();
        }
      },
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
    required Product product,
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
              child: CachedNetworkImage(
                imageUrl: product.galleries[0].url,
                width: 215,
                height: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CenterProgressBar(),
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
                product.category?.name ?? "",
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
                product.name,
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
                "\$${product.price}",
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

  Widget _productTile(
      {required BuildContext context, required Product product}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ProductDetailPage.routeName,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: product.galleries[0].url,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CenterProgressBar(),
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
                product.category?.name ?? "",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                product.name,
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
                "\$${product.price}",
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

  Widget _content({required int categoryId}) {
    if (categoryId == 6) {
      return _allProduct(context: context);
    } else {
      return _productByCategory(context: context);
    }
  }

  Widget _allProduct({required BuildContext context}) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "Exclusive Product",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: Constants.semiBold,
                    fontSize: 18,
                  ),
            ),
          ),
          SizedBox(
            height: 300,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const CenterProgressBar();
                } else if (state is ProductSuccess) {
                  final product =
                      state.products.where((x) => x.price >= 200).toList();

                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: product.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                    itemBuilder: (context, index) {
                      return _productCard(
                        context: context,
                        product: product[index],
                      );
                    },
                  );
                } else {
                  return const CenterMessage(
                    text: Constants.emptyProductMessage,
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "New Arrival",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: Constants.semiBold,
                    fontSize: 18,
                  ),
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const CenterProgressBar();
              } else if (state is ProductSuccess) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    return _productTile(
                      context: context,
                      product: state.products[index],
                    );
                  },
                );
              } else {
                return const CenterMessage(
                  text: Constants.emptyProductMessage,
                );
              }
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
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "For you",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: Constants.semiBold,
                    fontSize: 18,
                  ),
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const CenterProgressBar();
              } else if (state is ProductByCategorySuccess) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 30,
                  ),
                  itemBuilder: (context, index) {
                    return _productTile(
                      context: context,
                      product: state.products[index],
                    );
                  },
                );
              } else {
                return const CenterMessage(
                  text: Constants.emptyProductMessage,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
