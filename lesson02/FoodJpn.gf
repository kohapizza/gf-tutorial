concrete FoodJpn of Food = {
  lincat
    Phrase, Item, Kind, Quality = {s : Str} ;

  lin
    Is item quality = {s = item.s ++ "は" ++ quality.s} ;
    IsQ item quality = {s = item.s ++ "は" ++ quality.s ++ "ですか"} ;
    ExcuseMeBut phrase = {s = "すみませんが" ++ phrase.s} ;

    This kind = {s = "この" ++ kind.s} ;
    That kind = {s = "あの" ++ kind.s} ;

    QKind quality kind = {s = quality.s ++ kind.s} ;
    Cheese = {s = "チーズ"} ;
    Fish = {s = "魚"} ;
    Tomato = {s = "トマト"} ;

    Very quality = {s = "とても" ++ quality.s} ;   

    Fresh = {s = "新鮮"} ;
    Warm = {s = "温かい"} ;
    Italian = {s = "イタリア風"} ;
    Expensive = {s = "高い"} ;
    Delicious = {s = "おいしい"} ;
    Boring = {s = "つまらない"} ;
    Beautiful = {s = "美しい"} ;
    Good = {s = "良い"} ;
    Fun = {s = "良い"} ;
}