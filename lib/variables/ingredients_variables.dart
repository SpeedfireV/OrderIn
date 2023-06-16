enum Ingredients { mushroom }

const String _directory = "lib/assets/icons/";

class IngredientsVariables {
  static Map<Ingredients, String> mapOfIngredientsDirectories = {
    Ingredients.mushroom: "${_directory}mushroom.png"
  };
  static Map<Ingredients, String> mapOfIngredientsName = {
    Ingredients.mushroom: "Mushroom"
  };
  static Map<Ingredients, String> mapOfIngredientsVolume = {
    Ingredients.mushroom: "50 g",
  };
  static Map<Ingredients, int> mapOfIngredientsPrice = {
    Ingredients.mushroom: 100,
  };
}
