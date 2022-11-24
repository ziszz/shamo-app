import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/pages/sign_up_page.dart';
import 'package:shamo_app/presentation/widgets/field_item.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _login({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    context.read<AuthBloc>().add(OnLogin(email: email, password: password));
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainPage.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    FormItem(
                      key: const Key("email_input"),
                      controller: _emailController,
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
                      key: const Key("pass_input"),
                      controller: _passController,
                      label: "Password",
                      prefixIcon: Image.asset(
                        "assets/ic-lock.png",
                        width: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FilledButton(
                      key: const Key("login_btn"),
                      onPressed: () => _login(
                        context: context,
                        email: _emailController.text,
                        password: _passController.text,
                      ),
                      child: Text(
                        "Sign In",
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
                  onTap: () => Navigator.pushNamed(
                    context,
                    SignUpPage.routeName,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.grey,
                          ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
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
            "Login",
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
