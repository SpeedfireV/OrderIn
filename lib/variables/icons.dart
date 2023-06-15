import 'package:meatingless/variables/sorting_options.dart';

const String _directory = "lib/assets/icons/";

class SortingVariables {
  static Map<SortingOptions, String> mapOfDirectories = {
    SortingOptions.all: "${_directory}all.png",
    SortingOptions.burgers: "${_directory}burger.png",
    SortingOptions.pizza: "${_directory}pizza.png",
    SortingOptions.noodles: "${_directory}ramen.png",
    SortingOptions.salads: "${_directory}salad.png",
    SortingOptions.drinks: "${_directory}cocktail.png",
  };
  static Map<SortingOptions, String> mapOfTitles = {
    SortingOptions.all: "All",
    SortingOptions.burgers: "Burgers",
    SortingOptions.pizza: "Pizzas",
    SortingOptions.noodles: "Noodles",
    SortingOptions.salads: "Salads",
    SortingOptions.drinks: "Drinks",
  };
}
