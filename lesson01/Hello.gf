-- a "Hello World" grammar
-- Hello という名前の abstract syntax module
abstract Hello = {

  flags startcat = Greeting ;

  cat Greeting ; Recipient ; 

  fun
    Hello : Recipient -> Greeting ;
    Goodbye : Recipient -> Greeting ;
    GoodMorning : Recipient -> Greeting ;
    GoodAfternoon : Recipient -> Greeting ;
    World, Mum, Friends, Cat, Dog, Dad, Pizza, Drums : Recipient ;
}