# 記録

## Using grammars in the GF system

1. grammar をファイルに分ける
    ```
    Hello.gf
    HelloEng.gf
    HelloFin.gf
    HelloIta.gf
    ```
    - Hello.gf: abstract syntax
    - その他ファイル: 各 concrete syntax

2. import (i)
    ```
    i HelloEng.gf
    ```
    これは、grammerをgrammar をコンパイルして読み込むこと。
    コンパイルすると、`.gfo` 拡張子のファイル(GFのコンパイル済み内部形式)ができる。

3. parse (p)
    ```
    p "hello world"
    ```
    Hello World が出力される。
    これは、文字列 → ASTの変換。

4. linearize (l)
    ```
    l Hello World
    ```
    結果
    ```
    hello world
    terve maailma
    ciao mondo
    ```
    これは、AST → 文字列の変換。language 指定なしで実行すると、全 concrete syntaxに対して生成されるため、multilingual generationとなる。

5. parse failure
    ```
    p "hello dad"
    ```
    これは、Dad という Recipient が grammar に存在しないため、失敗する。

6. translation
    ```
    parse -lang=HelloEng "hello mum" | linearize -lang=HelloIta
    ```
    結果
    ```
    ciao mamma
    ```
    これは以下を表す。translation = AST を介した変換。
    ```
    English string
    ↓ parse
    AST
    ↓ linearize
    Italian string
    ```

## Exercises on the Hello World grammar
1. Test the parsing and translation examples shown above, as well as some other examples, in different combinations of languages.
    **parse**
    ```
    p -lang=HelloFin "terve ystävät"
    ```
    結果
    ```
    Hello Friends
    ```

    **linearize**
    ```
    l -lang=HelloIta (Hello World)
    ```
    結果
    ```
    ciao mondo
    ```

    **translation**
    ```
    p -lang=HelloEng "hello mum" | l -lang=HelloIta
    ```
    結果
    ```
    ciao mamma    
    ```

    **multilingual generation**
    ```
    p -lang=HelloEng "hello friends" | l
    ```
    結果
    ```
    hello friends
    terve ystävät
    ciao amici
    ```



2. Extend the grammar Hello.gf and some of the concrete syntaxes by five new recipients and one new greeting form.

abstract syntax を拡張
```
abstract Hello = {

  flags startcat = Greeting ;

  cat Greeting ; Recipient ; 

  fun
    Hello : Recipient -> Greeting ;
    Goodbye : Recipient -> Greeting ;
    World, Mum, Friends, Cat, Dog, Dad, Pizza, Drums : Recipient ;
}
```

concrete syntax 側(Engのみ)も更新
```
-- Hello という abstract syntax を英語として表現する
concrete HelloEng of Hello = {

  -- Greeting と Recipient: 文字列を持つレコード
  lincat Greeting, Recipient = {s : Str} ;

  lin
    Hello recip = {s = "hello" ++ recip.s} ;
    Goodbye recip = {s = "goodbye" ++ recip.s} ;
    World = {s = "world"} ;
    Mum = {s = "mum"} ;
    Friends = {s = "friends"} ;
    Cat = {s = "cat"} ; 
    Dog = {s = "dog"} ;
    Dad = {s = "dad"} ;
    Pizza = {s = "pizza"} ;
    Drums = {s = "drums"} ;
}
```

```
p -lang=HelloEng "goodbye pizza"
```
結果
```
Goodbye Pizza
```

```
l -lang=HelloEng (Goodbye Dad)
```
結果
```
goodbye dad
```
おおおおおお👏

3. Add a concrete syntax for some other languages you might know.

HelloJpnを追加。
```
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
```

```
p -lang=HelloJpn "こんにちは ピザ"
```
結果
```
Hello Pizza
```

```
l -lang=HelloJpn (Goodbye Dad)
```
結果
```
さようなら お父さん
```


4. Add a pair of greetings that are expressed in one and the same way in one language and in two different ways in another. For instance, good morning and good afternoon in English are both expressed as buongiorno in Italian. Test what happens when you translate buongiorno to English in GF.


ambiguous parsingを実装する。
abstract syntax(`Hello.gf`) に以下を追加する。
```
GoodMorning : Recipient -> Greeting ;
GoodAfternoon : Recipient -> Greeting ;
```

`HelloEng.gf` に以下を追加。
```
GoodMorning recip = {s = "good morning" ++ recip.s} ;
GoodAfternoon recip = {s = "good afternoon" ++ recip.s} ;
```

`HelloIta.gf` に以下を追加。
```
GoodMorning recip = {s = "buongiorno" ++ recip.s} ;
GoodAfternoon recip = {s = "buongiorno" ++ recip.s} ;
```

parseしてみると、1 string → multiple ASTs となった。
```
p -lang=HelloIta "buongiorno mamma"
```
結果
```
GoodAfternoon Mum
GoodMorning Mum
```

translateしてみる。
```
p -lang=HelloIta "buongiorno mamma" | l -lang=HelloEng
```
結果
```
good afternoon mum
good morning mum
```

## GF scripts

### Exercise. (For Unix hackers.) Write a GF application that reads an English string from the standard input and writes an Italian translation to the output.

`en2it.sh` を作成。

```
echo "hello mum" | ./en2it.sh
```

結果
```
ciao mamma
```

