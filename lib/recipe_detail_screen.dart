import 'package:flutter/material.dart';
import 'recipe.dart';


class RecipeDetailScreen extends StatefulWidget {

  final Recipe recipe;
  final List<String> myIngredients;

  RecipeDetailScreen({required this.recipe, required this.myIngredients});

  @override
  State<RecipeDetailScreen> createState() {
    return _RecipeDetailScreenState();
  }
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {

  List<bool> checked = [];

  @override
  void initState() {
    super.initState();

    checked = List.filled(widget.recipe.ingredients.length, false);
  }

  bool iHaveIt(String ingredientName) {
    for (var mine in widget.myIngredients) {
      if (ingredientName.toLowerCase().contains(mine.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.recipe.name,
          style: TextStyle(
            color:Colors.white, fontSize:16
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.recipe.image,
              height: 220,
              width: double.infinity,
              fit:BoxFit.cover,
              errorBuilder: (context, error, stackTrace){
                return Container(
                  height:220,
                  color:Colors.grey,
                  child: Icon(Icons.fastfood, size: 60, color: Colors.grey),
                );
              },
            ),

            Padding(
              padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipe.name,
                      style:TextStyle(
                        fontSize:22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 16, color: Colors.grey),
                        SizedBox(width:4),
                        Text("${widget.recipe.time} min",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width:16),
                        Icon(Icons.people, size:16, color:Colors.grey),
                        SizedBox(width:4),
                        Text("${widget.recipe.servings} servings",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width:16),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:8, vertical:2),
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.recipe.difficulty,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height:8),

                    Text(
                      widget.recipe.description,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    SizedBox(height:20),

                    Text(
                      "Your Ingredients",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height:8),

                    Column(
                      children: List.generate(widget.recipe.ingredients.length, (index) {
                        Ingredient ing = widget.recipe.ingredients[index];
                        bool haveIt = iHaveIt(ing.name);
                        return Row(
                          children: [
                            Checkbox(
                              value: checked[index],
                              activeColor: Colors.teal,
                              onChanged: (value) {
                                setState(() {
                                  checked[index] = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                "${ing.name} — ${ing.amount}",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            // Missing badge
                            if (!haveIt)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Missing",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                          ],
                        );
                      }),
                    ),

                    SizedBox(height:8),

                    Text(
                      "Cooling Instructions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height:8),

                    Column(
                      children: List.generate(widget.recipe.steps.length, (index){
                        return Padding(
                          padding: EdgeInsets.only(bottom:12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:28,
                                  height:28,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text("${index + 1}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width:12),

                                Expanded(
                                  child: Text(
                                    widget.recipe.steps[index],
                                    style: TextStyle(
                                      fontSize:14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        );
                      }),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: Size(
                            double.infinity,
                            50
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Start Cooking",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}