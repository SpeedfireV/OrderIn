import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/database.dart';
import 'package:meatingless/services/order_history.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/widgets/general/element_title.dart';

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
    Iterable<List> items = ref.watch(orderHistoryProvider);
    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElementTitle(title: "Order History"),
          ],
        ),
        const SizedBox(height: 24),
        ListView.separated(
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              debugPrint(DatabaseServices().getOrders().toString());
              try {
                debugPrint(items.elementAt(index).toString());
              } catch (e) {
                debugPrint("here!!!");
              }

              return Material(
                elevation: 5,
                child: ListTile(
                  tileColor: AppColors.lightColor,
                  onTap: () {},
                  leading: const Icon(Icons.lock_clock),
                  title: Text(dateToString(
                      items.elementAt(index).elementAt(0).addTime)),
                  subtitle: Text(
                      "\$${price(wholeHistoryPrice(items.elementAt(index)) + 500)}"),
                ),
              );
            })
      ]),
    );
  }
}
