import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/widgets/carousel_item.dart';
import 'package:meatingless/widgets/element_title.dart';
import 'package:meatingless/widgets/filter_options.dart';

import '../services/bottom_app_bar.dart';
import '../widgets/bottom_bar.dart';

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
              leading: const Icon(Icons.search),
              hintText: "Search",
              surfaceTintColor: MaterialStateProperty.all(AppColors.lightColor),
              backgroundColor: MaterialStateProperty.all(AppColors.lightColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
              trailing: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  onPressed: () {},
                  color: AppColors.mainColor,
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 100, child: FilterOptionsWidget()),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElementTitle(title: "Popular Items"),
          ),
          SizedBox(height: 8),
          CarouselSlider(
            items: [
              CarouselItem(
                item: FoodItem(
                    name: "Vege Beef Burger",
                    description: "Very tasty burger.",
                    price: 899,
                    mainImage: "lib/assets/images/vege-beef-burger.jpg",
                    rating: 50,
                    numberOfRating: 3800,
                    favourite: false,
                    ingredients: []),
              ),
              CarouselItem(
                item: FoodItem(
                    name: "NY Style Earthy Pizza",
                    description: "The impressive one.",
                    price: 1699,
                    mainImage: "lib/assets/images/vege-beef-burger.jpg",
                    rating: 50,
                    numberOfRating: 3800,
                    favourite: false,
                    ingredients: []),
              )
            ],
            options: CarouselOptions(
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
              autoPlayInterval: Duration(milliseconds: 4500),
              enlargeCenterPage: true,
              height: 260,
              autoPlay: true,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElementTitle(title: "Delicious Sets"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
          SizedBox(height: 8),
          SizedBox(height: 100)
        ],
      ),
      const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: AppBottomBar()),
      )
    ]));
  }
}
