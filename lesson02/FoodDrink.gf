abstract FoodDrink = Food, Drink ** {
  flags startcat = Phrase ;

  fun
    DrinkKind : Drink -> Kind ;
}