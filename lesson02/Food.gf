abstract Food = {
  flags startcat = Phrase ;

  cat
    Phrase ; Item ; Kind ; Quality ;

  fun
    Is : Item -> Quality -> Phrase ;
    IsQ : Item -> Quality -> Phrase ;
    ExcuseMeBut : Phrase -> Phrase ;
    This, That : Kind -> Item ;
    QKind : Quality -> Kind -> Kind ;
    Cheese, Fish, Tomato : Kind ;
    Very : Quality -> Quality ;
    Fresh, Warm, Italian, Expensive, Delicious, Boring, Beautiful, Good, Fun : Quality ;
}