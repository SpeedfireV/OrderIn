import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/functions/price.dart';
import '../../variables/colors.dart';
import '../../variables/ingredients_variables.dart';

class IngredientSelector extends ConsumerStatefulWidget {
  const IngredientSelector({super.key, required this.ingredient});
  final Ingredients ingredient;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IngredientSelectorState();
}

class _IngredientSelectorState extends ConsumerState<IngredientSelector> {
  @override
  Widget build(BuildContext context) {
    Ingredients ingredient = widget.ingredient;
    return CheckboxListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      value: true,
      onChanged: (newState) {},
      title: Text(IngredientsVariables.mapOfIngredientsName[ingredient]!),
      subtitle: Text(
          "${IngredientsVariables.mapOfIngredientsVolume[ingredient]} +\$${price(IngredientsVariables.mapOfIngredientsPrice[ingredient]!)}"),
      secondary: Image(
          width: 24,
          height: 24,
          image: AssetImage(
              IngredientsVariables.mapOfIngredientsDirectories[ingredient]!)),
    );
  }
}
