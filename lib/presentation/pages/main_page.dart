import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/chat_page.dart';
import 'package:shamo_app/presentation/pages/favorite_page.dart';
import 'package:shamo_app/presentation/pages/home_page.dart';
import 'package:shamo_app/presentation/pages/profile_page.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: HomePage.appBar(context: context),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            HomePage(),
            ChatPage(),
            FavoritePage(),
            ProfilePage(),
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
      onPressed: () {},
      child: Image.asset(
        "assets/ic-cart.png",
        width: 20,
      ),
    );
  }

  Widget _navBarItem({
    required int index,
    required ImageProvider image,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      hoverColor: AppColors.purple,
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
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
          color: AppColors.black3,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navBarItem(
                index: 0,
                image: const AssetImage(
                  "assets/ic-home.png",
                ),
              ),
              _navBarItem(
                index: 1,
                image: const AssetImage(
                  "assets/ic-message.png",
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              _navBarItem(
                index: 2,
                image: const AssetImage(
                  "assets/ic-favorite.png",
                ),
              ),
              _navBarItem(
                index: 3,
                image: const AssetImage(
                  "assets/ic-profile.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
