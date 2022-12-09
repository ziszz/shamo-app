import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:shamo_app/presentation/widgets/error_snackbar.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = "/edit-profile";

  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _usernameController = TextEditingController(text: widget.user.username);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: SafeArea(
        child: _form(context: context),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.clear,
          color: AppColors.white,
        ),
      ),
      actions: [
        BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      OnUpdate(
                        token: widget.user.token ?? "",
                        name: _nameController.text,
                        email: _emailController.text,
                        username: _usernameController.text,
                      ),
                    );
              },
              icon: const Icon(
                Icons.check,
                color: AppColors.purple,
              ),
            );
          },
          listener: (context, state) {
            if (state is AuthUpdateSuccess) {
              Navigator.pop(context);
            } else if (state is AuthError) {
              errorSnackbar(
                context: context,
                message: "Gagal update profile. Silahkan coba lagi nanti!!",
              );
            }
          },
        ),
      ],
      title: Text(
        "Favorite Shoes",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
              fontWeight: Constants.medium,
              fontSize: 18,
            ),
      ),
    );
  }

  Widget _inputItem({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                  fontSize: 13,
                ),
          ),
          TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                ),
            decoration: const InputDecoration(
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black6,
                  width: 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black6,
                  width: 1,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black6,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "assets/images/default-user-profile.png",
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        _inputItem(
          context: context,
          label: "Name",
          controller: _nameController,
        ),
        _inputItem(
          context: context,
          label: "Username",
          controller: _usernameController,
        ),
        _inputItem(
          context: context,
          label: "Email Address",
          controller: _emailController,
        ),
      ],
    );
  }
}
