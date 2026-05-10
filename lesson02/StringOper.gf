resource StringOper = {
  oper
    -- {s : Str}というrecord type に、SSという alias を付けている
    SS : Type = {s : Str} ;
    ss : Str -> SS = \x -> {s = x} ;
    cc : SS -> SS -> SS = \x,y -> ss (x.s ++ y.s) ;
    prefix : Str -> SS -> SS = \p,x -> ss (p ++ x.s) ;
    infix : Str -> SS -> SS -> SS = \p,x,y -> ss (x.s ++ p ++ y.s) ;
    infixq : Str -> SS -> SS -> SS = \p,x,y -> ss (p ++ x.s ++ y.s) ;
}