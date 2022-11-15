import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Column(children: [
        TabBar(
          indicatorWeight: 0,
          indicator: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: Theme.of(context).textTheme.bodyText2,
          unselectedLabelStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: light,
              ),
          padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
          splashBorderRadius: BorderRadius.circular(12),
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          tabs: [
            _tabItem(text: "Tab 1"),
            _tabItem(text: "Tab 2"),
            _tabItem(text: "Tab 3"),
            _tabItem(text: "Tab 4"),
            _tabItem(text: "Tab 5"),
            _tabItem(text: "Tab 6"),
          ],
        ),
        const Expanded(
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Text("Tab 1"),
              ),
              Center(
                child: Text("Tab 2"),
              ),
              Center(
                child: Text("Tab 3"),
              ),
              Center(
                child: Text("Tab 4"),
              ),
              Center(
                child: Text("Tab 5"),
              ),
              Center(
                child: Text("Tab 6"),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  static AppBar appBar({required BuildContext context}) {
    return AppBar(
      toolbarHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        title: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Alex",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: semiBold,
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    "@alexkeinn",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: regular,
                          color: AppColors.grey,
                        ),
                  ),
                ],
              ),
              Image.asset(
                "assets/default-user-profile.png",
                width: 54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.black2,
        ),
      ),
      child: Tab(text: text),
    );
  }
}
