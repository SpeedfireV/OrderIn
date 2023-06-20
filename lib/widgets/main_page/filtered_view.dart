import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/services/all_items.dart';
import 'package:meatingless/services/functions/add_to_cart.dart';
import 'package:meatingless/services/functions/price.dart';
import 'package:meatingless/services/ingredients.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/variables/sorting_options.dart';
import 'package:meatingless/variables/sorting_variables.dart';
import 'package:meatingless/widgets/general/element_title.dart';

class FilteredItemsView extends ConsumerStatefulWidget {
  const FilteredItemsView({super.key, required this.filter});
  final FilterOptions filter;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilteredItemsViewState();
}

class _FilteredItemsViewState extends ConsumerState<FilteredItemsView> {
  @override
  Widget build(BuildContext context) {
    List<FoodItem> items = ref.watch(allItemsProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ElementTitle(
              title: "${SortingVariables.mapOfTitles[widget.filter]!}s"),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            List<FoodItem> filteredItems = items
                .where((element) => element.category == widget.filter)
                .toList();
            return InkWell(
              onTap: () {
                currentIngredients = items
                    .where((element) => element.category == widget.filter)
                    .elementAt(index)
                    .ingredients;
                router.pushNamed("item",
                    extra: items
                        .where((element) => element.category == widget.filter)
                        .elementAt(index));
              },
              child: Ink(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 4),
                height: 138,
                child: Row(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                          height: 130,
                          width: 155,
                          fit: BoxFit.fill,
                          image: AssetImage(filteredItems[index].mainImage))),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          filteredItems[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "\$${price(filteredItems[index].price)}",
                          style: const TextStyle(fontSize: 15),
                        ),
                        Expanded(child: Container()),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                          const MaterialStatePropertyAll(5),
                                      backgroundColor: MaterialStatePropertyAll(
                                          AppColors.mainColor),
                                      minimumSize:
                                          const MaterialStatePropertyAll(
                                              Size(0, 48))),
                                  onPressed: () {
                                    addToCart(
                                        items
                                            .where((element) =>
                                                element.category ==
                                                widget.filter)
                                            .elementAt(index),
                                        ref,
                                        []);
                                  },
                                  child: Text(
                                    "Add To Order",
                                    style: TextStyle(
                                        color: AppColors.lightColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            );
          },
          itemCount: items
              .where((element) => element.category == widget.filter)
              .length,
        )
      ],
    );
  }
}
