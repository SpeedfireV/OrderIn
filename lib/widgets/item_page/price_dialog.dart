import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/models/ingredient_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/variables/padding.dart';

import '../../services/functions/price.dart';

class PriceDialog extends ConsumerWidget {
  const PriceDialog(
      {super.key,
      required this.item,
      required this.activeIngredients,
      this.customTitle});
  final FoodItem item;
  final List<Ingredient>? activeIngredients;
  final String? customTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: 8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            customTitle ?? "Price",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const Divider(),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
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
          const Divider(),
          PriceTag(
              title: "Total Price",
              localPrice: activeIngredients != null
                  ? activeIngredients!.fold(
                      item.price,
                      (previousValue, element) => (previousValue +
                          IngredientsVariables
                              .mapOfIngredientsPrice[element.ingredientEnum]!))
                  : item.price),
          TextButton(
              onPressed: () {
                router.pop();
              },
              child: const Text(
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
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(width: 4),
        Text("\$${price(localPrice)}")
      ],
    );
  }
}
