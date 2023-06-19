import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/all_items.dart';
import 'package:meatingless/services/orders.dart';
import 'package:meatingless/services/sorting_options.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/variables/sorting_options.dart';
import 'package:meatingless/widgets/main_page/carousel_item.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/main_page/filter_options.dart';
import 'package:badges/badges.dart' as badges;
import 'package:meatingless/widgets/main_page/filtered_view.dart';

import '../routing/router.dart';
import '../services/bottom_app_bar.dart';
import '../widgets/main_page/bottom_bar.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(bottomAppBarPositionProvider);
    int numberOfNewItems = ref.watch(newItemsProvider);
    List<FoodItem> items = ref.watch(AllItemsProvider);
    FilterOptions currentFilter = ref.watch(sortingOptionsProvider);
    return Scaffold(
        body: Stack(children: [
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: horizontalPadding, right: horizontalPadding, top: 16),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Search",
              surfaceTintColor: MaterialStateProperty.all(AppColors.lightColor),
              backgroundColor: MaterialStateProperty.all(AppColors.lightColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
              trailing: [
                IconButton(
                  icon: ref.read(newItemsProvider.notifier).state > 0
                      ? badges.Badge(
                          badgeContent: Text(
                            numberOfNewItems.toString(),
                            style: TextStyle(color: AppColors.lightColor),
                          ),
                          badgeStyle: badges.BadgeStyle(
                              badgeColor:
                                  AppColors.mainColorReversed.withOpacity(0.9)),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        )
                      : const Icon(
                          Icons.shopping_cart_outlined,
                        ),
                  onPressed: () {
                    router.pushNamed("order");
                    ref.read(newItemsProvider.notifier).state = 0;
                  },
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 100, child: FilterOptionsWidget()),
          const SizedBox(height: 24),
          currentFilter == FilterOptions.all
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: ElementTitle(title: "Popular Items"),
                    ),
                    const SizedBox(height: 8),
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return CarouselItem(
                            item: items
                                .where((element) =>
                                    element.rating > 45 &&
                                    element.numberOfRating > 500 &&
                                    element.category != FilterOptions.special)
                                .elementAt(index));
                      },
                      itemCount: items
                          .where((element) =>
                              element.rating > 45 &&
                              element.numberOfRating > 400 &&
                              element.category != FilterOptions.special)
                          .length,
                      options: CarouselOptions(
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1200),
                        autoPlayInterval: const Duration(milliseconds: 4500),
                        enlargeCenterPage: true,
                        height: 260,
                        autoPlay: true,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ElementTitle(title: "Specials Of The Day"),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "See All",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding),
                      child: SizedBox(
                        height: 240,
                        child: CarouselItem(
                            item: items.firstWhere((element) =>
                                element.category == FilterOptions.special)),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                )
              : FilteredItemsView(
                  filter: currentFilter,
                )
        ],
      ),
      const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 16),
            child: AppBottomBar()),
      )
    ]));
  }
}
