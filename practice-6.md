## Rubyのオブジェクト指向機能

>**〇オブジェクト...**  
  **「データ」** と **「メソッド」** を備え持っている。  
  なんらかの **「クラス」** から生成される。  
>
>**〇オブジェクト指向とは...**  
  「もの(オブジェクト)」になぞらえてプログラムを設計したり動かしたりすること。  
>
>**〇クラスとは...**  
  オブジェクトがどんなデータを持っているか、どんな機能を備えているかを定義しておく **「ひな形(設計図)」** のようなもの。  
  クラスから **インスタンス化(実体化)** することで、オブジェクトが生成される。
>
>**〇「ひな形(設計図)」とは...**  
  ひとつの設計図から複数の製品を作り上げることが出来る。  
  生成したオブジェクトは、**それぞれ違うデータを保持して**、それぞれ **個別に動作** する。

クラスの作り方
----------
``` ruby
class クラス名
  def initialize(引数)
    初期化処理
  end
  # initializeメソッドは、newメソッドで実体化したときに
  # 無条件に実行される「初期化処理」

  クラスの持つデータを定義
  クラスの持つ機能を定義
end
```

<details><summary>サンプルコード</summary>

冷蔵庫 モデルAクラス
-----------
``` ruby
class ReizoukoA
  # 設定温度を受け取ってインスタンス変数に保持する
  def initialize( num )
    @set_temperature = num.to_i  # 目標の設定温度
    @temperature = 25            # 現在の温度
    @foodstuff = []              # 食材
    power(:on)                   # 電源
    puts "設定温度を #{@set_temperature} に設定しました"
    puts "現在の温度は #{@temperature} です"
    puts "#{@foodstuff.size} 個の食材があります"
  end

  # 冷やす機能:1回の実行で-1℃冷える
  def cool_down
    @temperature -= 1 if @set_temperature < @temperature
    puts "内部で冷やして #{@temperature} になりました"
  end

  # ドアが開く機能
  # 内部温度が上昇する。食材を一覧表示する
  def open_door
    @temperature += 3   # 一回開けるごとに３℃上昇すると仮定する
    puts "内部温度が上昇して #{@temperature} になりました"
    puts "#{@foodstuff.size} 個の食材があります"
    @foodstuff.each do |v|
      puts v
    end
  end

  # 冷蔵庫に食材を入れる(追加する)
  def put_in( str )
    @foodstuff << str
  end

  # 電源ON
  def power( onoff )
    puts "電源を入れました" if onoff.to_sym == :on
    puts "電源を切りました" if onoff.to_sym == :off
  end
end
```  

実行制御
----------
``` ruby
if __FILE__ == $0 then
  modelA = ReizoukoA.new(15)
  modelA.cool_down
  modelA.puts_in("apple")
  modelA.open_door
  modelA.power(:off)
end
```  

実行結果
----------
```
電源を入れました
設定温度を 15 に設定しました
現在の温度は 25 です
0 個の食材があります
内部で冷やして 24 になりました
内部温度が上昇して 27 になりました
1 個の食材があります
apple
電源を切りました
```
</details>

モジュールとは...
----------
- 「共通部品集」のようなもの。
- 「継承」は **できない** 
- 「インスタンスの生成」も **できない** 

モジュールの作り方
----------
``` ruby
module モジュール名
  機能を定義
  # 相手先でincludeされると、moduleの中身(内側)だけが相手先で展開される
end
```

冷蔵庫モデルAで電源機能を「部品化」する
----------

<details><summary>冷蔵庫 モデルAクラス</summary>

``` ruby
# reizoukoA.rb

# 追加
+ requier "./power.rb"

class ReizoukoA
  # 設定温度を受け取ってインスタンス変数に保持する
  def initialize( num )
    @set_temperature = num.to_i  # 目標の設定温度
    @temperature = 25            # 現在の温度
    @foodstuff = []              # 食材
    power(:on)                   # 電源
    puts "設定温度を #{@set_temperature} に設定しました"
    puts "現在の温度は #{@temperature} です"
    puts "#{@foodstuff.size} 個の食材があります"
  end

  # 冷やす機能:1回の実行で-1℃冷える
  def cool_down
    @temperature -= 1 if @set_temperature < @temperature
    puts "内部で冷やして #{@temperature} になりました"
  end

  # ドアが開く機能
  # 内部温度が上昇する。食材を一覧表示する
  def open_door
    @temperature += 3   # 一回開けるごとに３℃上昇すると仮定する
    puts "内部温度が上昇して #{@temperature} になりました"
    puts "#{@foodstuff.size} 個の食材があります"
    @foodstuff.each do |v|
      puts v
    end
  end

  # 冷蔵庫に食材を入れる(追加する)
  def put_in( str )
    @foodstuff << str
  end

  # 追加と削除
- def power( onoff )
-   puts "電源を入れました" if onoff.to_sym == :on
-   puts "電源を切りました" if onoff.to_sym == :off
- end

+ include Power

end
```  
</details>    

### モジュール化
``` ruby
# power.rb

module Power
  # 電源ON
  def power( onoff )
    puts "電源を入れました" if onoff.to_sym == :on
    puts "電源を切りました" if onoff.to_sym == :off
  end
end 
# include されると内部のメソッドだけが相手先で展開される
```

「ひな型(設計図)」ってどういうこと？
----------
- 違う設計図を **引用して(受け継いで)** 、バージョンアップさせて新たな設計図にすることが出来る

### これを **「継承」** という

- 設計図を継承して、既存の **機能を上書き** してバージョンアップさせることが出来る

### これを **「オーバーライド」** という

継承する方法・オーバーライドする方法
----------
``` ruby
class クラス名 < 継承させる親クラス名
  追加する機能を定義
  既存の機能を再定義
  # 同名のメソッドをもう一度定義すると、上書きしたことになる
end
```

Railsでは
----------
- データベースを管理する「モデル」はクラスになっている
- 「モデル」はActiveRecordクラスを継承している
``` ruby
class User < ApplicationRecord

class ApplicationRecord < ActiveRecord::Base
# 上記のように書かれている
```  

冷蔵庫モデルAを継承したモデルBの作成(冷却機能が強化)
----------
``` ruby  
# reizoukoB.rb

# 冷蔵庫モデルB クラス
# モデルAを継承する
require "./reizouko.rb"

class ReizoukoB < ReizoukoA
  # 既存の機能を上書きする
  # 同名のメソッドがあればオーバーライドされる
  # 既に定義されているものは改めて書く必要がない
  def cool_down
    @temperature -= 3
    puts "冷やす機能がパワーアップしました"
    puts "現在の温度は #{@temperature} です"
  end
end
```

実行制御
----------
``` ruby
if __FILE__ == $0 then
  reizoukoB = ReizoukoB.new(15)
  reizoukoB.cool_down
  reizoukoB.power(:off)
end 

```

実行結果
----------
```
電源を入れました
設定温度を 15 に設定しました
現在の温度は 25 です
0 個の食材があります
冷やす機能がパワーアップしました
現在の温度は 22 です
電源を切りました
```

さらに知識っ！！
----------
- 複数のクラスから同時に並行して継承することは **出来ない。** これを **「単一継承」** という。
- クラスの継承とモジュールのinclude を同時に使うことが出来る。これを **「Mix-in」** という。
- 文字列クラスや配列クラスなど、すべての親クラスをたどっていくと、Objectクラスにたどり着く。
- Objectクラスがすべての始祖。究極のスーパークラス。