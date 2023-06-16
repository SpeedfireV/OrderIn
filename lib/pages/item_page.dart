import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/images.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/variables/sorting_options.dart';
import 'package:meatingless/variables/sorting_variables.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/item_page/ingredient_selector.dart';
import 'package:meatingless/widgets/outlined_icon_button.dart';
import 'package:numeral/numeral.dart';

import '../services/functions/price.dart';
import '../services/functions/rating.dart';

class ItemPage extends ConsumerStatefulWidget {
  const ItemPage({super.key, required this.item});
  final FoodItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemPageState();
}

class _ItemPageState extends ConsumerState<ItemPage> {
  @override
  Widget build(BuildContext context) {
    FoodItem item = widget.item;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 90),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  )),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage(SortingVariables
                              .mapOfSortingDirectories[item.category]!),
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          SortingVariables.mapOfTitles[item.category]!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "${rating(item.rating)}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " (${Numeral(item.numberOfRating).format()} Reviews)",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColorReversed),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppColors.mainColorReversed.withOpacity(0.2),
                        BlendMode.darken),
                    child: Image(
                      image: AssetImage(item.mainImage),
                      height: 260,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElementTitle(title: "Details"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 4),
                        Text(
                          "15 min",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(item.description),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElementTitle(title: "Add Extra Ingredients"),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    IngredientSelector(ingredient: item.ingredients[index]),
                itemCount: item.ingredients.length,
              ),
              SizedBox(height: 80)
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(0, 56)),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.mainColor)),
                      child: Text(
                        "Add To Order",
                        style: TextStyle(
                            color: AppColors.lightColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedIconButton(
                    icon: Icons.arrow_back,
                    function: () {
                      router.pop();
                    }),
                ElevatedIconButton(
                    icon: Icons.favorite_outline_rounded, function: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
