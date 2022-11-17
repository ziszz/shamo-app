import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/pages/checkout_success_page.dart';
import 'package:shamo_app/presentation/widgets/filled_button.dart';
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
      bottomNavigationBar: _bottomAppBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                _listItems(),
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

  Widget _bottomAppBar({required BuildContext context}) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const Divider(
            color: AppColors.black5,
            thickness: 1,
          ),
          const SizedBox(
            height: 30,
          ),
          FilledButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              CheckoutSuccessPage.routeName,
              (route) => false,
            ),
            child: Text(
              "Checkout Now",
              style: Theme.of(context).textTheme.button?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemTile({
    required BuildContext context,
    required String imagePath,
    required String name,
    required double price,
  }) {
    return ListTile(
      tileColor: AppColors.black4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: 50,
        ),
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontWeight: semiBold,
            ),
      ),
      subtitle: Text(
        "\$$price",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.blue,
            ),
      ),
      trailing: Text(
        "2 Items",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.grey,
            ),
      ),
    );
  }

  Widget _listItems() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      padding: const EdgeInsets.only(top: 12),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return _itemTile(
          context: context,
          imagePath: "assets/product-example.png",
          name: "Terrex Urban Low",
          price: 143.98,
        );
      },
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

  Widget _summaryItem({
    required BuildContext context,
    required String leading,
    required String trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                ),
          ),
          Text(
            trailing,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
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
          const SizedBox(
            height: 12,
          ),
          _summaryItem(
            context: context,
            leading: "Product Quantity",
            trailing: "2 items",
          ),
          _summaryItem(
            context: context,
            leading: "Product Price",
            trailing: "\$575.96",
          ),
          _summaryItem(
            context: context,
            leading: "Shipping",
            trailing: "Free",
          ),
          const Divider(
            color: AppColors.black5,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: semiBold,
                    ),
              ),
              Text(
                "\$575.92",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: semiBold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
