import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/pages/edit_profile_page.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/widgets/center_progress_bar.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _content(context: context);
  }

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black1,
      toolbarHeight: 125,
      titleSpacing: 30,
      title: Row(
        children: [
          Image.asset(
            "assets/images/default-user-profile.png",
            width: 64,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Alex",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: Constants.semiBold,
                      color: AppColors.white,
                    ),
              ),
              Text(
                "@alexkeinn",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: Constants.regular,
                      color: AppColors.grey,
                    ),
              ),
            ],
          ),
          const Spacer(),
          BlocConsumer(
            listener: (context, state) {
              if (state is AuthLogoutSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginPage.routeName,
                  (route) => false,
                );
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
                    content: Text(
                      state.message,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: Constants.medium,
                          ),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const CenterProgressBar();
              } else {
                return const InkWell(
                  child: ImageIcon(
                    AssetImage("assets/images/ic-logout.png"),
                    size: 20,
                    color: AppColors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _optionItem({
    required BuildContext context,
    required Function() onTap,
    required String text,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _content({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: Constants.semiBold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          _optionItem(
            context: context,
            onTap: () => Navigator.pushNamed(
              context,
              EditProfilePage.routeName,
            ),
            text: "Edit Profile",
          ),
          _optionItem(
            context: context,
            onTap: () {},
            text: "Your Orders",
          ),
          _optionItem(
            context: context,
            onTap: () {},
            text: "Help",
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "General",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: Constants.semiBold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          _optionItem(
            context: context,
            onTap: () {},
            text: "Privacy & Policy",
          ),
          _optionItem(
            context: context,
            onTap: () {},
            text: "Term of Service",
          ),
          _optionItem(
            context: context,
            onTap: () {},
            text: "Rate App",
          ),
        ],
      ),
    );
  }
}
