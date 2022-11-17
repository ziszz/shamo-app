import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = "/checkout";

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black3,
      appBar: _appBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "List Items",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: semiBold,
                      ),
                ),
                _addressDetails(context: context),
                _paymentSummary(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        splashColor: Colors.transparent,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.white,
          size: 20,
        ),
      ),
      backgroundColor: AppColors.black1,
      toolbarHeight: 87,
      title: Text(
        "Checkout Detail",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.white,
              fontWeight: medium,
              fontSize: 18,
            ),
      ),
    );
  }

  Widget _addressItem({
    required BuildContext context,
    required Widget icon,
    required String title,
    required subtitle,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.black5,
          child: icon,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grey,
                    fontWeight: light,
                  ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: medium,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _addressDetails({required BuildContext context}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address Details",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: medium,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          _addressItem(
            context: context,
            icon: const ImageIcon(
              AssetImage(
                "assets/ic-building.png",
              ),
              color: AppColors.lightBlue,
              size: 17,
            ),
            title: "Store Location",
            subtitle: "Adidas Core",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              "assets/vertical-divider.png",
            ),
          ),
          _addressItem(
            context: context,
            icon: const ImageIcon(
              AssetImage(
                "assets/ic-location.png",
              ),
              color: AppColors.lightBlue,
              size: 17,
            ),
            title: "Your Address",
            subtitle: "Marsemoon",
          ),
        ],
      ),
    );
  }

  Widget _paymentSummary({required BuildContext context}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: medium,
                ),
          ),
        ],
      ),
    );
  }
}
