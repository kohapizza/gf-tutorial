concrete HelloJpn of Hello = {

  lincat Greeting, Recipient = {s : Str} ;

  lin
    Hello recip = {s = "こんにちは" ++ recip.s} ;
    Goodbye recip = {s = "さようなら" ++ recip.s} ;
    World = {s = "世界"} ;
    Mum = {s = "お母さん"} ;
    Friends = {s = "友達"} ;
    Dad = {s = "お父さん"} ;
    Cat = {s = "猫"} ;
    Dog = {s = "犬"} ;
    Drums = {s = "ドラム"};
    Pizza = {s = "ピザ"};
}