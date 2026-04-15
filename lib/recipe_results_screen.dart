import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipes_data.dart';
import 'recipe_detail_screen.dart';

class RecipeResultsScreen extends StatelessWidget {

  final List<String> myIngredients;
  RecipeResultsScreen(this.myIngredients);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Recipes for You",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: allRecipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = allRecipes[index];
          int missing = recipe.missingCount(myIngredients);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(
                    recipe: recipe,
                    myIngredients: myIngredients,
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          recipe.image,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          // errorBuilder: (context, error, stackTrace) {
                          //   return Container(
                          //     height: 180,
                          //     color: Colors.grey[200],
                          //     child: Icon(Icons.fastfood, size: 60, color: Colors.grey),
                          //   );
                          // },
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: missing == 0 ? Colors.teal : Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            missing == 0 ? "Ready to Cook" : "Missing $missing Ingredient${missing > 1 ? 's' : ''}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.timer, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text("${recipe.time} min",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.people, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text("${recipe.servings} servings",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 16),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                recipe.difficulty,
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}