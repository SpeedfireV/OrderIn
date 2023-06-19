enum Ingredients {
  mushroom,
  extraSoySauce,
  chiliFlakes,
  kimchi,
}

const String _directory = "lib/assets/icons/";

class IngredientsVariables {
  static Map<Ingredients, String> mapOfIngredientsDirectories = {
    Ingredients.mushroom: "${_directory}mushroom.png",
    Ingredients.extraSoySauce: "${_directory}mushroom.png",
    Ingredients.chiliFlakes: "${_directory}mushroom.png",
    Ingredients.kimchi: "${_directory}mushroom.png"
  };
  static Map<Ingredients, String> mapOfIngredientsName = {
    Ingredients.mushroom: "Mushroom",
    Ingredients.extraSoySauce: "Extra Soy Sauce",
    Ingredients.chiliFlakes: "Extra Chili Flakes",
    Ingredients.kimchi: "Kimchi"
  };
  static Map<Ingredients, String> mapOfIngredientsVolume = {
    Ingredients.mushroom: "50 g",
    Ingredients.extraSoySauce: "",
    Ingredients.chiliFlakes: "",
    Ingredients.kimchi: "100 g",
  };
  static Map<Ingredients, int> mapOfIngredientsPrice = {
    Ingredients.mushroom: 100,
    Ingredients.extraSoySauce: 49,
    Ingredients.chiliFlakes: 49,
    Ingredients.kimchi: 249,
  };
}
