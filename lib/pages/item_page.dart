import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/services/ingredients.dart';
import 'package:meatingless/services/orders.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/sorting_variables.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/item_page/ingredient_selector.dart';
import 'package:meatingless/widgets/item_page/price_dialog.dart';
import 'package:meatingless/widgets/icon_buttons.dart';
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
    ref.watch(ingredientsPriceProvider);
    ref.watch(ingredientsListProvider);
    ref.watch(ordersProvider);
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 90),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 24),
                  )),
              const SizedBox(height: 8),
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
                        const SizedBox(width: 8),
                        Text(
                          SortingVariables.mapOfTitles[item.category]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating(item.rating),
                          style: const TextStyle(
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
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
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
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(item.description),
              ),
              const SizedBox(height: 24),
              item.ingredients.isNotEmpty
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: ElementTitle(title: "Add Extra Ingredients"),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => IngredientSelector(
                            ingredient: ref
                                .read(ingredientsListProvider.notifier)
                                .state[index],
                            index: index,
                          ),
                          itemCount: item.ingredients.length,
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 80)
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
                          minimumSize:
                              const MaterialStatePropertyAll(Size(0, 56)),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.mainColor)),
                      child: Text(
                        "Add To Order",
                        style: TextStyle(
                            color: AppColors.lightColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        router.pop();
                        ref.read(ordersProvider.notifier).addItem(item);
                      },
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
                Material(
                  elevation: 1.5,
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => PriceDialog(
                              item: item,
                              activeIngredients: ref
                                  .read(ingredientsListProvider.notifier)
                                  .state
                                  .toList()
                                  .where((element) => element.active == true)
                                  .toList()));
                    },
                    child: Ink(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            color: AppColors.lightColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          "\$${price(item.price + ref.read(ingredientsPriceProvider.notifier).state)}${ref.read(ingredientsPriceProvider.notifier).state != 0 ? " (Extra: \$${price(ref.read(ingredientsPriceProvider.notifier).state)})" : ""}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ))),
                  ),
                ),
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
