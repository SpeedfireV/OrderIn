enum FilterOptions { all, burgers, pizza, salads, noodles, drinks, special }

List listSortingOptions() {
  List list = [];
  for (var i in FilterOptions.values) {
    list.add(i);
  }

  return list;
}
