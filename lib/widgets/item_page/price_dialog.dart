import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/models/ingredient_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/widgets/general/element_title.dart';

import '../../services/functions/price.dart';

class PriceDialog extends ConsumerWidget {
  const PriceDialog(
      {super.key, required this.item, required this.activeIngredients});
  final FoodItem item;
  final List<Ingredient>? activeIngredients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElementTitle(title: "Price"),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => index == 0
                ? PriceTag(title: item.name, localPrice: item.price)
                : PriceTag(
                    title: IngredientsVariables.mapOfIngredientsName[
                        activeIngredients![index - 1].ingredientEnum]!,
                    localPrice: IngredientsVariables.mapOfIngredientsPrice[
                        activeIngredients![index - 1].ingredientEnum]!),
            itemCount:
                activeIngredients != null ? activeIngredients!.length + 1 : 1,
          ),
          Divider(),
          TextButton(
              onPressed: () {
                router.pop();
              },
              child: Text(
                "Close",
                style: TextStyle(fontWeight: FontWeight.w600),
              ))
        ]),
      ),
    );
  }
}

class PriceTag extends ConsumerWidget {
  const PriceTag({super.key, required this.title, required this.localPrice});
  final String title;
  final int localPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text("\$${price(localPrice)}")
      ],
    );
  }
}