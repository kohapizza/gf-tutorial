-- Hello という abstract syntax を英語として表現する
concrete HelloEng of Hello = {

  -- Greeting と Recipient: 文字列を持つレコード
  lincat Greeting, Recipient = {s : Str} ;

  lin
    Hello recip = {s = "hello" ++ recip.s} ;
    Goodbye recip = {s = "goodbye" ++ recip.s} ;
    GoodMorning recip = {s = "good morning" ++ recip.s} ;
    GoodAfternoon recip = {s = "good afternoon" ++ recip.s} ;
    World = {s = "world"} ;
    Mum = {s = "mum"} ;
    Friends = {s = "friends"} ;
    Cat = {s = "cat"} ; 
    Dog = {s = "dog"} ;
    Dad = {s = "dad"} ;
    Pizza = {s = "pizza"} ;
    Drums = {s = "drums"} ;
}