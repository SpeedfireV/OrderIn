import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/models/ingredient_model.dart';
import 'package:meatingless/services/functions/define_ingredient.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/images.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/variables/sorting_options.dart';
import 'package:meatingless/widgets/main_page/carousel_item.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/main_page/filter_options.dart';

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
    return Scaffold(
        body: Stack(children: [
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ElementTitle(title: "Popular Items"),
          ),
          const SizedBox(height: 8),
          CarouselSlider(
            items: [
              CarouselItem(
                item: FoodItem(
                    name: "Vege Beef Burger",
                    description: "Very tasty burger.",
                    category: SortingOptions.burgers,
                    price: 899,
                    mainImage: LocalImages.vegeBeefBurger,
                    rating: 49,
                    numberOfRating: 3800,
                    favourite: false,
                    ingredients: []),
              ),
              CarouselItem(
                item: FoodItem(
                    name: "NY Style Earthy Pizza",
                    description: "The impressive one.",
                    category: SortingOptions.pizza,
                    price: 1699,
                    mainImage: LocalImages.nyEarthyPizza,
                    rating: 44,
                    numberOfRating: 3500,
                    favourite: false,
                    ingredients: []),
              )
            ],
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(milliseconds: 1200),
              autoPlayInterval: const Duration(milliseconds: 4500),
              enlargeCenterPage: true,
              height: 260,
              autoPlay: true,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 240,
              child: CarouselItem(
                  item: FoodItem(
                      name: "Breakfast Set",
                      description: "The impressive one.",
                      category: SortingOptions.all,
                      price: 3999,
                      mainImage: LocalImages.seaSet,
                      rating: 47,
                      numberOfRating: 570,
                      favourite: false,
                      ingredients: [defineIngredient(Ingredients.mushroom)])),
            ),
          ),
          const SizedBox(height: 100)
        ],
      ),
      const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: AppBottomBar()),
      )
    ]));
  }
}
