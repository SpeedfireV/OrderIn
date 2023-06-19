import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/orders.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/item_page/price_dialog.dart';

import '../../routing/router.dart';
import '../../services/functions/price.dart';
import '../../services/functions/whole_price.dart';
import '../../variables/colors.dart';
import '../general/icon_buttons.dart';

class ItemListTile extends ConsumerStatefulWidget {
  const ItemListTile({super.key, required this.index});
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemListTileState();
}

class _ItemListTileState extends ConsumerState<ItemListTile> {
  @override
  Widget build(BuildContext context) {
    Map<FoodItem, int> orders = ref.watch(ordersProvider);
    int index = widget.index;
    return InkWell(
      onTap: () {
        debugPrint("Working");
        showDialog(
            context: context,
            builder: (context) => PriceDialog(
                customTitle:
                    "${orders.keys.toList().elementAt(index).name} Price",
                item: orders.keys.toList().elementAt(index),
                activeIngredients:
                    orders.keys.toList().elementAt(index).ingredients));
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: 4),
        height: 148,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                fit: BoxFit.fill,
                height: double.infinity,
                width: 180,
                image: AssetImage(orders.keys.toList()[widget.index].mainImage),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          orders.keys
                                  .toList()
                                  .elementAt(widget.index)
                                  .ingredients
                                  .isEmpty
                              ? orders.keys.toList()[widget.index].name
                              : "${orders.keys.toList()[widget.index].name} (With Extras)",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      Text(
                          "\$${price(wholeItemPrice(orders.keys.toList()[widget.index]))}"),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedIconButton(
                        icon: Icons.remove,
                        function: () {
                          if (orders.values.elementAt(widget.index) == 1) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      icon: const Icon(
                                        Icons.delete_rounded,
                                        size: 30,
                                      ),
                                      title: const Text(
                                        "Delete Item",
                                      ),
                                      content: Text(
                                          "Are you sure you want to delete ${orders.keys.toList().elementAt(widget.index).name} from your order?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              router.pop();
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .mainColorReversed,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              ref
                                                  .read(ordersProvider.notifier)
                                                  .deleteItem(orders.keys
                                                      .toList()
                                                      .elementAt(widget.index));
                                              router.pop();
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: AppColors.alertColor,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ],
                                    ));
                          } else {
                            ref.read(ordersProvider.notifier).decreaseItem(
                                orders.keys.toList()[widget.index]);
                          }
                        },
                        size: 20,
                        padding: 4,
                      ),
                      Text("${orders.values.toList()[widget.index]}"),
                      OutlinedIconButton(
                        icon: Icons.add,
                        function: () {
                          ref
                              .read(ordersProvider.notifier)
                              .addItem(orders.keys.toList()[widget.index]);
                        },
                        size: 20,
                        padding: 4,
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      icon: const Icon(
                                        Icons.delete_rounded,
                                        size: 30,
                                      ),
                                      title: const Text(
                                        "Delete Item",
                                      ),
                                      content: Text(
                                          "Are you sure you want to delete ${orders.keys.toList().elementAt(widget.index).name} from your order?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              router.pop();
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .mainColorReversed,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              ref
                                                  .read(ordersProvider.notifier)
                                                  .deleteItem(orders.keys
                                                      .toList()
                                                      .elementAt(widget.index));
                                              router.pop();
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: AppColors.alertColor,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ],
                                    ));
                          },
                          icon: Icon(
                            Icons.close,
                            color: AppColors.mainColorReversed,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
