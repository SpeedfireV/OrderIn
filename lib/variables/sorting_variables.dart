import 'package:meatingless/variables/sorting_options.dart';

const String _directory = "lib/assets/icons/";

class SortingVariables {
  static Map<FilterOptions, String> mapOfSortingDirectories = {
    FilterOptions.all: "${_directory}all.png",
    FilterOptions.burgers: "${_directory}burger.png",
    FilterOptions.pizza: "${_directory}pizza.png",
    FilterOptions.noodles: "${_directory}ramen.png",
    FilterOptions.salads: "${_directory}salad.png",
    FilterOptions.drinks: "${_directory}cocktail.png",
    FilterOptions.special: "${_directory}cocktail.png",
  };
  static Map<FilterOptions, String> mapOfTitles = {
    FilterOptions.all: "All",
    FilterOptions.burgers: "Burger",
    FilterOptions.pizza: "Pizza",
    FilterOptions.noodles: "Noodle",
    FilterOptions.salads: "Salad",
    FilterOptions.drinks: "Drink",
    FilterOptions.special: "Special"
  };
}
