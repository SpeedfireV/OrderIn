import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/services/orders.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/widgets/icon_buttons.dart';

import '../models/food_item_model.dart';
import '../services/functions/price.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(ordersProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28.0, left: 24, right: 24),
                    child: Text(
                      "My Order",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          FoodItem item = ref
                              .read(ordersProvider.notifier)
                              .state
                              .keys
                              .elementAt(index);
                          ref.watch(ordersProvider);
                          // TODO:  Add Responsive Number Off Products
                          return SizedBox(
                            height: 140,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    height: double.infinity,
                                    width: 180,
                                    image: AssetImage(item.mainImage),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Text("\$${price(item.price)}"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          OutlinedIconButton(
                                            icon: Icons.remove,
                                            function: () {},
                                            size: 20,
                                            padding: 4,
                                          ),
                                          Text(
                                              "${ref.read(ordersProvider.notifier).state[item]}"),
                                          OutlinedIconButton(
                                            icon: Icons.add,
                                            function: () {
                                              ref
                                                  .read(ordersProvider.notifier)
                                                  .addItem(item);
                                            },
                                            size: 20,
                                            padding: 4,
                                          ),
                                          Expanded(child: Container()),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.close,
                                                color:
                                                    AppColors.mainColorReversed,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 24),
                        itemCount:
                            ref.read(ordersProvider.notifier).state.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8))),
                          onPressed: () {
                            router.pop();
                          },
                          icon: Icon(Icons.add),
                          label: Text("Add More Items")),
                    ),
                  ),
                  SizedBox(height: 16)
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
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$63.96",
                            style: TextStyle(
                                color: AppColors.mainColorReversed,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
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
                      Divider(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            "\$68.96",
                            style: TextStyle(
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
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      color: AppColors.lightColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                onPressed: () {
                                  ref
                                      .read(ordersProvider.notifier)
                                      .resetOrder();
                                  router.pop();
                                },
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
            padding: const EdgeInsets.only(top: 16.0, left: 16),
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
