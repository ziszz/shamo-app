import 'package:flutter/material.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/presentation/pages/cart_page.dart';
import 'package:shamo_app/presentation/pages/chat_page.dart';
import 'package:shamo_app/presentation/pages/favorite_page.dart';
import 'package:shamo_app/presentation/pages/home_page.dart';
import 'package:shamo_app/presentation/pages/profile_page.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main";

  final User user;

  const MainPage({super.key, required this.user});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarList = [
      HomePage.appBar(context: context),
      ChatPage.appBar(context: context),
      FavoritePage.appBar(context: context),
      ProfilePage.appBar(context: context),
    ];

    return Scaffold(
      backgroundColor: _currentIndex != 0 ? AppColors.black3 : AppColors.black1,
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBarList[_currentIndex],
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            HomePage(
              token: widget.user.token ?? "",
            ),
            const ChatPage(),
            const FavoritePage(),
            ProfilePage(
              token: widget.user.token ?? "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingButton() {
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
    return GestureDetector(
      onTap: () {
        _pageController.jumpToPage(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ImageIcon(
          image,
          color: _currentIndex == index ? AppColors.purple : AppColors.grey,
          size: 20,
        ),
      ),
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
