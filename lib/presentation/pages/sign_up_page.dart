import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/widgets/field_item.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

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
            top: 50,
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
                        "assets/ic-profile.png",
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
                        "assets/ic-username.png",
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormItem(
                      label: "Email Address",
                      prefixIcon: Image.asset(
                        "assets/ic-email.png",
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormItem(
                      label: "Password",
                      prefixIcon: Image.asset(
                        "assets/ic-lock.png",
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
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: AppColors.white,
                              fontWeight: medium,
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
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: AppColors.grey,
                          ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: AppColors.purple,
                                fontWeight: medium,
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
      automaticallyImplyLeading: false,
      title: Text(
        "Sign Up",
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: AppColors.white,
              fontWeight: semiBold,
            ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(12),
        child: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 16),
          child: Text(
            "Register and Happy Shoping",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: AppColors.grey,
                ),
          ),
        ),
      ),
    );
  }
}
