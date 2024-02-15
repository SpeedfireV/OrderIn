import 'package:freezed_annotation/freezed_annotation.dart';

enum FilterOptions {
  @JsonValue("all")
  all,
  @JsonValue("burgers")
  burgers,
  @JsonValue("pizza")
  pizza,
  @JsonValue("salads")
  salads,
  @JsonValue("noodles")
  noodles,
  @JsonValue("drinks")
  drinks,
  @JsonValue("special")
  special
}

List listSortingOptions() {
  List list = [];
  for (var i in FilterOptions.values) {
    list.add(i);
  }

  return list;
}
