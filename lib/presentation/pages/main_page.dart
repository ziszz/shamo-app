import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/home_page.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/";

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: HomePage.appBar(context: context),
      body: const SafeArea(
        child: HomePage(),
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

  Widget _bottomNavBar() {
    return SizedBox(
      height: 80,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.black2,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: ImageIcon(
                  AssetImage(
                    "assets/ic-home.png",
                  ),
                  color: AppColors.purple,
                  size: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: "Chats",
                icon: ImageIcon(
                  AssetImage(
                    "assets/ic-message.png",
                  ),
                  color: AppColors.grey,
                  size: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: SizedBox(),
              ),
              BottomNavigationBarItem(
                label: "Favorites",
                icon: ImageIcon(
                  AssetImage(
                    "assets/ic-favorite.png",
                  ),
                  color: AppColors.grey,
                  size: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: ImageIcon(
                  AssetImage(
                    "assets/ic-profile.png",
                  ),
                  color: AppColors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
