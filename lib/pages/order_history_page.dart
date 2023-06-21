import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/services/order_history.dart';
import 'package:meatingless/widgets/general/element_title.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List<FoodItemDb> items = ref.watch(orderHistoryProvider);
    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElementTitle(title: "Order History"),
          ],
        ),
        const SizedBox(height: 8),
        ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
                onTap: () {},
                leading: const Icon(Icons.lock_clock),
                title: Text(items[index].addTime.toString())))
      ]),
    );
  }
}
