import 'recipe.dart';

List<Recipe> allRecipes =[

  Recipe(
    id: '1',
    name:"Creamy Tomato Pasta",
    image:"https://munchingwithmariyah.com/wp-content/uploads/2023/08/IMG_4836.jpg",
    time:25,
    servings:4,
    difficulty:"Easy",
    description: "A rish and creamy tomato pasta perfect for a quick weeknight dinner.",
    ingredients: [
      Ingredient('Tomato', "4 large"),
      Ingredient('Onion', '1 medium'),
      Ingredient('Pasta', '400g'),
      Ingredient('Heavy Cream', '200ml'),
      Ingredient('Garlic', '3 cloves'),
      Ingredient('Olive Oil', '2 tbsp'),
    ],
    steps:[
      'Boil pasta according to package instructions.',
      'Fry onion and garlic in olive oil for 5 minutes.',
      'Add tomatoes and cook for 10 minutes.',
      'Pour in heavy cream and simmer for 5 minutes.',
      'Mix pasta with sauce and serve.',
    ],
  ),

  Recipe(
    id: '2',
    name:"Grilled Chicken with herbs",
    image: "https://www.feastingathome.com/wp-content/uploads/2021/06/Grilled-lemon-Herb-Chicken-17.jpg",
    time:30,
    servings:2,
    difficulty:"Medium",
    description: "Juicy grilled chicken marinated in fresh herbs and spices.",
    ingredients: [
      Ingredient('Chicken', "2 breasts"),
      Ingredient('Garlic', '4 cloves'),
      Ingredient('Lemon', '1 whole'),
      Ingredient('Rosemary', '2 springs'),
      Ingredient('Olive Oil', '3 tbsp'),
    ],
    steps:[
      'Mix garlic, lemon juice and olive oil.',
      'Marinate chicken for 15 minutes.',
      'Preheat grill to medium-high heat.',
      'Grill chicken 6 minutes each side.',
      'Rest for 5 minutes before serving.',
    ],
  ),

  Recipe(
    id: '3',
    name:"Vegetable Stir Fry",
    image:"https://ohsweetbasil.com/wp-content/uploads/the-best-easy-stir-fry-vegetables-recipe-6-480x270.jpg",
    time:20,
    servings:3,
    difficulty:"Easy",
    description: "Quick and healthy vegetable stir fry with soy sauce.",
    ingredients: [
      Ingredient('Onion', "1 large"),
      Ingredient('Garlic', '2 cloves'),
      Ingredient('Carrot', '2 medium'),
      Ingredient('Soy Sauce', '3 tbsp'),
      Ingredient('Olive Oil', '2 tbsp'),
    ],
    steps:[
      'Heat oil in a large pan.',
      'Add onion and garlic, cook 3 minutes.',
      'Add carrots and stir fry 5 minutes.',
      'Add soy sauce and mix well.',
      'Serve hot with rice.',
    ],
  ),

  Recipe(
    id: '4',
    name:"Classic Omelette",
    image: "https://cdn11.bigcommerce.com/s-otmh7tu94l/product_images/uploaded_images/omelette.jpg",
    time:10,
    servings:1,
    difficulty:"Easy",
    description: "A simple and delicious classic omelette.",
    ingredients: [
      Ingredient('Eggs', "3 large"),
      Ingredient('Butter', '1 tbsp'),
      Ingredient('Onion', '1 small'),
      Ingredient('Salt', '2 pinch'),
    ],
    steps:[
      'Beat eggs with salt.',
      'Melt butter in a pan.',
      'Add onion and cook 2 minutes.',
      'Pour eggs and cook on low heat.',
      'Fold and serve immediately',
    ],
  ),

  Recipe(
    id: '5',
    name: "Garlic Bread",
    image: "https://t4.ftcdn.net/jpg/04/95/26/55/360_F_495265563_fuXU7CT1Xrc3FJEBwU8PGwXUlXufsFkq.jpg",
    time:15,
    servings:4,
    difficulty:"Easy",
    description: "Crispy and buttery garlic bread perfect as a side dish",
    ingredients: [
      Ingredient('Bread', "1 loaf"),
      Ingredient('Butter', '4 tbsp'),
      Ingredient('Garlic', '4 cloves'),
    ],
    steps:[
      'Preheat oven to 180C.',
      'Mix butter with minced garlic.',
      'Spread on bread  slices.',
      'Bake for 10 minutes until golden.',
      'Serve hot.',
    ],
  ),

];