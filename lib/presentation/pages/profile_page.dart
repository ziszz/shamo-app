import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/pages/edit_profile_page.dart';
import 'package:shamo_app/presentation/pages/login_page.dart';
import 'package:shamo_app/presentation/widgets/center_progress_bar.dart';
import 'package:shamo_app/presentation/widgets/error_snackbar.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class ProfilePage extends StatelessWidget {
  final String token;

  const ProfilePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return _content(context: context);
  }

  Widget _optionItem({
    required BuildContext context,
    required Function() onTap,
    required String text,
  }) {
    return InkWell(
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
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamed(
                  context,
                  EditProfilePage.routeName,
                  arguments: state.user,
                );
              }
            },
            child: _optionItem(
              context: context,
              onTap: () => context.read<AuthBloc>().add(
                    OnGetCurrentUser(token: token),
                  ),
              text: "Edit Profile",
            ),
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

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black1,
      toolbarHeight: 125,
      titleSpacing: 30,
      title: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginPage.routeName,
              (route) => false,
            );
          } else if (state is AuthError) {
            errorSnackbar(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: state.user.profilePhotoUrl,
                    width: 64,
                    placeholder: (context, url) => const CenterProgressBar(),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/default-user-profile.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, ${state.user.name}",
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
                const Spacer(),
                InkWell(
                  onTap: () => context.read<AuthBloc>().add(
                        OnLogout(token: state.user.token ?? ""),
                      ),
                  child: const ImageIcon(
                    AssetImage("assets/images/ic-logout.png"),
                    size: 20,
                    color: AppColors.red,
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
