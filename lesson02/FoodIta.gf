concrete FoodIta of Food = {
  lincat
    Phrase, Item, Kind, Quality = {s : Str} ;
  
  lin
    Is item quality = {s = item.s ++ "è" ++ quality.s} ;
    IsQ item quality = {s = "è" ++ item.s ++ quality.s} ;
    This kind = {s = "questo" ++ kind.s} ;
    That kind = {s = "quel" ++ kind.s} ;
    QKind quality kind = {s = kind.s ++ quality.s} ;
    Cheese = {s = "formaggio"} ;
    Fish = {s = "pesce"} ;
    Very quality = {s = "molto" ++ quality.s} ;
    Fresh = {s = "fresco"} ;
    Warm = {s = "caldo"} ;
    Italian = {s = "italiano"} ;
    Expensive = {s = "caro"} ;
    Delicious = {s = "delizioso"} ;
    Boring = {s = "noioso"} ;
    Beautiful = {s = "bellissima"} ;
    ExcuseMeBut phrase = {s = "scusami ma" ++ phrase.s} ;
    Fun = {s = "divertimento"} ;
    Good = {s = "Bene"} ;
    Tomato = {s = "pomodoro"} ;
}