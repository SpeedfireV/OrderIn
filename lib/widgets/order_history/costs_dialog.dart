import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/item_page/price_dialog.dart';

import '../../routing/router.dart';

class OrderHistoryDialog extends ConsumerWidget {
  const OrderHistoryDialog({super.key, required this.items});
  final List items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(items.toString());
    debugPrint(items[0].name);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ElementTitle(title: "Costs"),
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              reverse: true,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                return PriceTag(
                  title: items[index].extras
                      ? "${items[index].name} x${items[index].amount} (With Extras)"
                      : "${items[index].name} x${items[index].amount}",
                  localPrice: items[index].price * items[index].amount,
                );
              },
              itemCount: items.length,
            ),
            const PriceTag(title: "Delivery Fee", localPrice: 500),
            const Divider(),
            PriceTag(
                title: "Total Price",
                localPrice: items.fold(
                    500,
                    (previousValue, element) =>
                        previousValue +
                        (element as FoodItemDb).price * element.amount)),
            TextButton(
                onPressed: () {
                  router.pop();
                },
                child: const Text(
                  "Close",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
