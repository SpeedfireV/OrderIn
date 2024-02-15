import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/order_history.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/order_history/costs_dialog.dart';

import '../services/bottom_app_bar.dart';
import '../services/functions/date.dart';
import '../services/functions/price.dart';
import '../services/functions/whole_price.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    Iterable<List> items = ref.watch(orderHistoryProvider).toList().reversed;
    return Scaffold(
      body: items.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 24),
              child: Column(
                children: [
                  const Text(
                    "Order History",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your haven't order anything yet!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      ref
                          .read(bottomAppBarPositionProvider.notifier)
                          .changePosition(1);
                    },
                    label: const Text("Order Some Food"),
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            )
          : ListView(children: [
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElementTitle(title: "Order History"),
                ],
              ),
              const SizedBox(height: 24),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 5,
                      child: ListTile(
                        tileColor: AppColors.lightColor,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => OrderHistoryDialog(
                                    items: items.elementAt(index),
                                  ));
                        },
                        leading: const Icon(Icons.lock_clock),
                        title: Text(dateToString(
                            items.elementAt(index).elementAt(0).addTime)),
                        subtitle: Text(
                            "\$${price(wholeHistoryPrice(items.elementAt(index)) + 500)}"),
                      ),
                    );
                  }),
              const SizedBox(height: 100),
            ]),
    );
  }
}
