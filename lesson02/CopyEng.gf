concrete CopyEng of Copy = {
  lincat
    S, X = {s : Str} ;

  lin
    Copy x = {s = x.s ++ x.s} ;

    Empty = {s = ""} ;
    A x = {s = "a" ++ x.s} ;
    B x = {s = "b" ++ x.s} ;
}