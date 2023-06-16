import 'package:meatingless/variables/sorting_options.dart';

const String _directory = "lib/assets/icons/";

class SortingVariables {
  static Map<SortingOptions, String> mapOfSortingDirectories = {
    SortingOptions.all: "${_directory}all.png",
    SortingOptions.burgers: "${_directory}burger.png",
    SortingOptions.pizza: "${_directory}pizza.png",
    SortingOptions.noodles: "${_directory}ramen.png",
    SortingOptions.salads: "${_directory}salad.png",
    SortingOptions.drinks: "${_directory}cocktail.png",
  };
  static Map<SortingOptions, String> mapOfTitles = {
    SortingOptions.all: "All",
    SortingOptions.burgers: "Burger",
    SortingOptions.pizza: "Pizza",
    SortingOptions.noodles: "Noodle",
    SortingOptions.salads: "Salad",
    SortingOptions.drinks: "Drink",
  };
}
