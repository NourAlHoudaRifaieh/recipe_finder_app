class Ingredient {
  String name;
  String amount;

  Ingredient(this.name, this.amount);
}

class Recipe {
  String id;
  String name;
  String image;
  int time;
  int servings;
  String difficulty;
  String description;

  List<Ingredient> ingredients;
  List<String> steps;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.time,
    required this.servings,
    required this.difficulty,
    required this.description,
    required this.ingredients,
    required this.steps,
  });


  int matchCount(List<String>myIngredients){
  int count = 0;
  for (var ing in ingredients){
    for(var mine in myIngredients){
      if(ing.name.toLowerCase().contains(mine.toLowerCase())){
        count++;
        break;
      }
    }
  }
  return count;
  }

  int missingCount(List<String> myIngredients){
  return ingredients.length - matchCount(myIngredients);
  }

  bool isReady(List<String> myIngredients){
  return missingCount(myIngredients) == 0;
  }

}


