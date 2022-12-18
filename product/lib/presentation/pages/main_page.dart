import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/presentation/cubit/page_cubit.dart';
import 'package:product/presentation/pages/cart_page.dart';
import 'package:product/presentation/pages/chat_page.dart';
import 'package:product/presentation/pages/favorite_page.dart';
import 'package:product/presentation/pages/home_page.dart';
import 'package:product/presentation/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main";

  final String token;

  const MainPage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final appBarList = [
      HomePage.appBar(context: context),
      ChatPage.appBar(context: context),
      FavoritePage.appBar(context: context),
      ProfilePage.appBar(context: context),
    ];

    final pagelist = [
      HomePage(
        token: token,
      ),
      const ChatPage(),
      const FavoritePage(),
      ProfilePage(
        token: token,
      ),
    ];

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor:
              currentIndex != 0 ? AppColors.black3 : AppColors.black1,
          bottomNavigationBar: _bottomNavBar(),
          floatingActionButton: _floatingButton(context: context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: appBarList[currentIndex],
          body: SafeArea(
            child: pagelist[currentIndex],
          ),
        );
      },
    );
  }

  Widget _floatingButton({required BuildContext context}) {
    return FloatingActionButton(
      backgroundColor: AppColors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: () => Navigator.pushNamed(
        context,
        CartPage.routeName,
      ),
      child: Image.asset(
        "assets/images/ic-cart.png",
        width: 20,
      ),
    );
  }

  Widget _navBarItem({
    required int index,
    required ImageProvider image,
  }) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return GestureDetector(
          onTap: () {
            context.read<PageCubit>().setPage(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ImageIcon(
              image,
              color: currentIndex == index ? AppColors.purple : AppColors.grey,
              size: 20,
            ),
          ),
        );
      },
    );
  }

  Widget _bottomNavBar() {
    return SizedBox(
      height: 70,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        child: BottomAppBar(
          color: AppColors.black4,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navBarItem(
                index: 0,
                image: const AssetImage(
                  "assets/images/ic-home.png",
                ),
              ),
              _navBarItem(
                index: 1,
                image: const AssetImage(
                  "assets/images/ic-message.png",
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              _navBarItem(
                index: 2,
                image: const AssetImage(
                  "assets/images/ic-favorite.png",
                ),
              ),
              _navBarItem(
                index: 3,
                image: const AssetImage(
                  "assets/images/ic-profile.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
