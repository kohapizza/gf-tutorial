concrete HelloIta of Hello = {

  lincat Greeting, Recipient = {s : Str} ;

  lin
    Hello recip = {s = "ciao" ++ recip.s} ;
    GoodMorning recip = {s = "buongiorno" ++ recip.s} ;
    GoodAfternoon recip = {s = "buongiorno" ++ recip.s} ;
    World = {s = "mondo"} ;
    Mum = {s = "mamma"} ;
    Friends = {s = "amici"} ;
}