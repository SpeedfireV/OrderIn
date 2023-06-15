enum SortingOptions { all, burgers, pizza, salads, noodles, drinks }

List listSortingOptions() {
  List list = [];
  for (var i in SortingOptions.values) {
    list.add(i);
  }

  return list;
}
