## ----------- シンボルの作り方 ----------
:alphabet  # 文字列の先頭に：(コロン)があったらシンボル

:"aaa"  # シンボル(symbol)
":aaa"  # 文字列(string)
:":aaa" # シンボル

:aaa == :"aaa" # => true
:"aaa nnn %& () {}" # => シンボル


## ----------- ハッシュの作り方 ----------
{ "apple" => "リンゴ"} # => {"apple"=>"リンゴ"}
# 他の言語では、辞書やディクショナリと言ったりもする

# ハッシュのキーと値は何のオブジェクトでもOK
# 文字列だけでなく、配列でもシンボルでもOK
hs = {"key"=>"value"}
hs["key2"] = "value2"


## ----------- シンボルを使ったハッシュの作り方 ----------
{moji: "moji"} # シンボルをキーにしたハッシュ
# {:moji => "moji"} と同じ

{ :aaa => 100 } # => {:aaa=>100}
{ aaa: 100 } # => {:aaa=>100}
{ aaa: :bbb } # => {:aaa=>:bbb}


## ----------- ハッシュの繰り返して、中身を捜査する ----------
ハッシュ.each do |k,v| # キーと値をセットで扱う
  繰り返したい処理
end

hs = {apple: 100,
      banana: 150,
      cherry: 500}

hs.each do |k,v|
  puts k.class
  puts "===>" + v.to_s
end
# apple
# ===>100
# banana
# ===>150
# cherry
# ===>500


## ----------- ハッシュの要素を判定して、条件に一致したものを抽出する ----------
ハッシュ.select do |k,v| # Hitした全件を抽出
  判定条件式
end

hs.select! do |k.v|
  v < 200
end
p hs
# {:apple=>100, :banana=>150}


## ----------- ハッシュの要素を判定して、条件に一致したものを除外する ----------
ハッシュ.reject do |k,v| # Hitした全件を抽出
  判定条件式
end

hs.reject! do |k.v|
  v < 200
end
p hs
# {:cherry=>500}


## ----------- ハッシュから要素を削除する ----------
ハッシュ.delete(指定のキー)

hs.delete( :apple )
p hs
# {:banana=>150, :cherry=>500}

ハッシュ.delete_if ブロック条件式

hs.delete_if do |k.v|
  k.size <= 5
end
p hs
# {:banana=>150, :cherry=>500}


## ----------- その他便利メソッド ----------
ハッシュ.has_key?   # キーの存在確認
ハッシュ.has_value? # 値の存在確認
ハッシュ.keys       # キーだけを取り出した配列を返す
ハッシュ.value      # 値だけを取り出した配列を返す

p hs.has_key?(:apple) # true
p hs.has_value?(500)  # true
p hs.keys   # [:apple, :banana, :cherry]
p hs.values # [100, 150, 500]


## ----------- practice ----------
# ----- 1 -----
p ({"Red" => 0xff0000,
     "Green" => 0x00ff00,
     "Blue" => 0x0000ff
    }).???
# 3

??? = size
# ハッシュの大きさ(ハッシュが保持しているキーの数)を返している

# ----- 2 -----
x = {"foo" => 1, "bar" => 2, "baz" => 3}
y = x.invert
z = y.sort
p z

# [[1, "foo"], [2, "bar"], [3, "baz"]]

# invert は各要素の値とキーを反対にしたハッシュを返す
# sort は配列に変換した要素を(さらに配列に格納し)キーの昇順にソートする

# ----- 3 -----
h = {"foo" => 1, "bar" => 2}
  ???
p h
# {}

??? = h.delete_if {|key, value| true}

# h.clear でも同じ結果が得られる(clearはハッシュの全要素を削除する)
# reject はブロックを評価した結果が真である要素を削除した結果を返すが
# self(今回はh)から要素が削除されるわけではない
# reject!　を使えば削除される

# ----- 4 -----
組み込みクラスHashのメソッドとして使用できないもの
each_index

# ----- 5 -----
空の Hash オブジェクトを h に代入する記述として誤っているもの
h = Hash{}

# 正しいもの
# h = {}
# h = Hash.new
# h = Hash[]