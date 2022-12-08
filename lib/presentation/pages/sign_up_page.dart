import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/cubit/page_cubit.dart';
import 'package:shamo_app/presentation/pages/main_page.dart';
import 'package:shamo_app/presentation/widgets/center_progress_bar.dart';
import 'package:shamo_app/presentation/widgets/error_snackbar.dart';
import 'package:shamo_app/presentation/widgets/field_item.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/sign-up";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        textInputAction: TextInputAction.next,
                        controller: _nameController,
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
                        textInputAction: TextInputAction.next,
                        controller: _usernameController,
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
                        textInputAction: TextInputAction.next,
                        controller: _emailController,
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
                        textInputAction: TextInputAction.done,
                        controller: _passController,
                        label: "Password",
                        obscureText: true,
                        prefixIcon: Image.asset(
                          "assets/images/ic-lock.png",
                          width: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            context.read<PageCubit>().setPage(0);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainPage.routeName,
                              arguments: state.user,
                              (route) => false,
                            );
                          } else if (state is AuthError) {
                            errorSnackbar(
                              context: context,
                              message:
                                  "Maaf register gagal, silahkan coba lagi nanti!!",
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const CenterProgressBar();
                          } else {
                            return FilledButton(
                              onPressed: () => context.read<AuthBloc>().add(
                                    OnRegister(
                                      name: _nameController.text,
                                      username: _usernameController.text,
                                      email: _emailController.text,
                                      password: _passController.text,
                                    ),
                                  ),
                              child: Text(
                                "Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: Constants.medium,
                                    ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
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
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
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
