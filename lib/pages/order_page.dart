import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/services/orders.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/general/icon_buttons.dart';
import 'package:meatingless/widgets/item_page/item_listtile.dart';

import '../models/food_item_model.dart';
import '../services/functions/price.dart';
import '../services/functions/whole_price.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  Widget build(BuildContext context) {
    Map<FoodItem, int> orders = ref.watch(ordersProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 28.0,
                        left: horizontalPadding,
                        right: horizontalPadding),
                    child: Text(
                      "My Order",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemListTile(index: index);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                      itemCount: orders.length),
                  orders.keys.toList().isNotEmpty
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: horizontalPadding),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton.icon(
                                style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8))),
                                onPressed: () {
                                  router.pop();
                                },
                                icon: const Icon(Icons.add),
                                label: const Text("Add More Items")),
                          ),
                        )
                      : const Center(
                          child: Text("Your order is currently empty")),
                  const SizedBox(height: 16)
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: AppColors.mainColor.withOpacity(0.2),
                          spreadRadius: 1)
                    ],
                    color: AppColors.lightColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sub Total",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$${price(wholeOrderPrice(orders))}",
                            style: TextStyle(
                                color: AppColors.mainColorReversed,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Delivery Fee",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$5.00",
                            style: TextStyle(
                                color: AppColors.mainColorReversed,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const Divider(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            "\$${price(wholeOrderPrice(orders) + 500)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(0, 56)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColors.mainColor)),
                                onPressed: orders.isEmpty
                                    ? null
                                    : () {
                                        ref
                                            .read(ordersProvider.notifier)
                                            .resetOrder();
                                        router.pop();
                                      },
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      color: AppColors.lightColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: horizontalPadding),
            child: ElevatedIconButton(
                icon: Icons.arrow_back,
                function: () {
                  router.pop();
                }),
          ),
        ],
      ),
    );
  }
}
