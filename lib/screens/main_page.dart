import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/widgets/bottom_bar_item.dart';

import '../services/bottom_app_bar.dart';
import '../widgets/filter_icon.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(bottomAppBarPositionProvider);
    return Scaffold(
        body: Stack(children: [
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search",
              surfaceTintColor: MaterialStateProperty.all(AppColors.lightColor),
              backgroundColor: MaterialStateProperty.all(AppColors.lightColor),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
              trailing: [
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                  ),
                  onPressed: () {},
                  color: AppColors.mainColor,
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 16),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FilterIcon(
                          turned: index.remainder(2) == 0 ? true : false,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 24,
                        ),
                    itemCount: 5),
                SizedBox(width: 16),
              ],
            ),
          )
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(90),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(90),
              ),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBottomBarItem(icon: Icons.history, label: "history"),
                      AppBottomBarItem(
                        icon: Icons.home,
                        label: "home",
                      ),
                      AppBottomBarItem(icon: Icons.person, label: "profile")
                    ]),
              ),
            ),
          ),
        ),
      )
    ]));
  }
}
