import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/orders.dart';

import '../../routing/router.dart';
import '../../variables/colors.dart';

class DeleteItemDialog extends ConsumerStatefulWidget {
  const DeleteItemDialog(
      {super.key, required this.index, required this.function});
  final int index;
  final VoidCallback function;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeleteItemDialogState();
}

class _DeleteItemDialogState extends ConsumerState<DeleteItemDialog> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    Map<FoodItem, int> orders = ref.watch(ordersProvider);
    return AlertDialog(
      icon: const Icon(
        Icons.delete_rounded,
        size: 30,
      ),
      title: const Text(
        "Delete Item",
      ),
      content: Text(
          "Are you sure you want to delete ${orders.keys.toList().elementAt(index).name} from your order?"),
      actions: [
        TextButton(
            onPressed: () {
              router.pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: AppColors.mainColorReversed,
                  fontWeight: FontWeight.w600),
            )),
        TextButton(
            onPressed: () {
              debugPrint("Button working with index $index");

              router.pop();
              widget.function.call();
            },
            child: Text(
              "Delete",
              style: TextStyle(
                  color: AppColors.alertColor, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
