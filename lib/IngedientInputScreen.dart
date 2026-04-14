import 'package:flutter/material.dart';

class IngredientInputScreen extends StatefulWidget {
  IngredientInputScreen({Key? key}) : super(key: key);

  @override
  _IngredientInputScreenState createState() {
    return _IngredientInputScreenState();
  }
}

class _IngredientInputScreenState extends State<IngredientInputScreen> {

  List<String> myIngredients =[];
  TextEditingController myController = TextEditingController();

  //to add an new ingredient
  void addIngredient(String value){
    if (value.trim() == "") return;
    setState(() {
      myIngredients.add(value.trim());
      myController.clear();
    });
  }

  //to remove the ingredient
  void removeIngredient(String item){
    setState(() {
      myIngredients.remove(item);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("What's in your kitchen?",
          style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding (
        padding: EdgeInsets.symmetric(horizontal:60, vertical:30 ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: myController,
              style: TextStyle(fontSize: 16, color: Colors.black, ),
              decoration:InputDecoration(
                hintText:"Add an ingrediant.....",
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:BorderSide(color:Colors.teal, width:2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:BorderSide(color:Colors.teal, width:3),
                ),
              ),
              onSubmitted: (value){
                setState(() {
                  myIngredients.add(value);
                  myController.clear();
                });
              }
            ),

            SizedBox(height:16),
            Text("Your Ingrediants: ", style: TextStyle(fontSize: 16, color: Colors.teal),),
            SizedBox(height:16),

            //to wrap
            Wrap(
              spacing: 8,
              runSpacing:8,
              children: myIngredients.map((item){
                return Chip(
                  backgroundColor: Colors.white,
                  label: Text(
                            item,
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                  onDeleted: (){
                    setState(() {
                      myIngredients.remove(item);
                    });
                  },
                );
              }).toList(),
            ),

            Spacer(),

           Padding(
             padding:EdgeInsets.only(bottom:200),
             child:ElevatedButton(
                 onPressed: (){},
                 style:ElevatedButton.styleFrom(
                   backgroundColor:Colors.teal,
                   minimumSize: Size(double.infinity, 50),
                 ),
                 child: Text(
                   "Find Recipes",
                   style:TextStyle(color:Colors.white, fontSize:16),
                 ),
           ),
           ),
        ],
      ),
    ),
    );
  }
}