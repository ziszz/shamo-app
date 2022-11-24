import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/widgets/field_item.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = "/sign-up";

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    FormItem(
                      label: "Full Name",
                      prefixIcon: Image.asset(
                        "assets/images/ic-profile.png",
                        width: 17,
                        color: AppColors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormItem(
                      label: "Username",
                      prefixIcon: Image.asset(
                        "assets/images/ic-username.png",
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormItem(
                      label: "Email Address",
                      prefixIcon: Image.asset(
                        "assets/images/ic-email.png",
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormItem(
                      label: "Password",
                      prefixIcon: Image.asset(
                        "assets/images/ic-lock.png",
                        width: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        MainPage.routeName,
                        (route) => false,
                      ),
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.white,
                              fontWeight: Constants.medium,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.grey,
                          ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.purple,
                                    fontWeight: Constants.medium,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      toolbarHeight: 87,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: Constants.semiBold,
                ),
          ),
          Text(
            "Sign In to Countinue",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
