import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/ingredients.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/padding.dart';

import '../../models/ingredient_model.dart';
import '../../services/functions/price.dart';
import '../../variables/ingredients_variables.dart';

class IngredientSelector extends ConsumerStatefulWidget {
  const IngredientSelector(
      {super.key, required this.ingredient, required this.index});
  final Ingredient ingredient;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IngredientSelectorState();
}

class _IngredientSelectorState extends ConsumerState<IngredientSelector> {
  @override
  Widget build(BuildContext context) {
    Ingredient ingredient = widget.ingredient;

    ref.watch(ingredientsPriceProvider);
    List<Ingredient> ingredients = ref.watch(ingredientsListProvider);
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      value: ingredient.active,
      onChanged: (newState) {
        Ingredient ingredientValue = ingredients[widget.index];

        ingredientValue.active
            ? ref.read(ingredientsPriceProvider.notifier).state -=
                IngredientsVariables
                    .mapOfIngredientsPrice[ingredientValue.ingredientEnum]!
            : ref.read(ingredientsPriceProvider.notifier).state +=
                IngredientsVariables
                    .mapOfIngredientsPrice[ingredientValue.ingredientEnum]!;
        ref.read(ingredientsListProvider.notifier).changeActive(widget.index);
      },
      title: Text(IngredientsVariables
          .mapOfIngredientsName[ingredient.ingredientEnum]!),
      subtitle: RichText(
          text: TextSpan(
              style: TextStyle(color: AppColors.mainColorReversed),
              children: [
            IngredientsVariables
                        .mapOfIngredientsVolume[ingredient.ingredientEnum] !=
                    ""
                ? TextSpan(
                    text:
                        "${IngredientsVariables.mapOfIngredientsVolume[ingredient.ingredientEnum]} ",
                    style: TextStyle(color: AppColors.mainColor))
                : const TextSpan(text: ""),
            TextSpan(
                text:
                    "+\$${price(IngredientsVariables.mapOfIngredientsPrice[ingredient.ingredientEnum]!)}")
          ])),
      secondary: Image(
          width: 24,
          height: 24,
          image: AssetImage(IngredientsVariables
              .mapOfIngredientsDirectories[ingredient.ingredientEnum]!)),
    );
  }
}
