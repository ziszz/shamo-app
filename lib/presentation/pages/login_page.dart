import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/presentation/widgets/filled_textfield.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class LoginPage extends StatelessWidget {
  static const path = "/login";
  static const routeName = "login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    _fieldItem(
                      context: context,
                      label: "Email Address",
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: AppColors.purple,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _fieldItem(
                      context: context,
                      label: "Password",
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                        color: AppColors.purple,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FilledButton(
                      child: Text(
                        "Sign In",
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
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: AppColors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: AppColors.purple,
                              fontWeight: medium,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Login",
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
            "Sign In to Countinue",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: AppColors.grey,
                ),
          ),
        ),
      ),
    );
  }

  Widget _fieldItem({
    required BuildContext context,
    required String label,
    required Widget prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: medium,
                color: AppColors.white,
                fontSize: 16,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        FilledTextField(
          hintText: "Your $label",
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
