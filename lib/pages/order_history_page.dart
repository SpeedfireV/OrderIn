import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/widgets/general/element_title.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        ElementTitle(title: "Order History"),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => const Row(
                  children: [Text("data")],
                ))
      ]),
    );
  }
}
