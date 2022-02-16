## ----------- 正規表現とは ----------
# 文字の「パターン」を表現するオブジェクト
# 記号をたくさん使って表す
# 例えば郵便番号　→ /^[0-9]{3}-[0-9]{4}$/
# 主に「条件文(if)」や「文字列のマッチング判定」で使われる

# ^    ...行頭を表す
# &    ...行末を表す
# .    ...任意の一文字を表す
# *    ...直前文字の０回以上の繰り返しを表す
# +    ...直前文字の１回以上の繰り返しを表す
# {m}  ...直前文字のｍ回以上の繰り返しを表す
# []   ...文字のクラスを表す
# \    ...記号をエスケープする

# \r   ...改行を表す
# \n   ...改行を表す
# \r\n ...改行を表す
# \t   ...タブを表す

# 数字が0-9で３文字、―(ハイフン)、数字が0-9で４文字かを判定
"117-0011" =~ /[0-9]{3}-[0-9]{4}/    # => 0 ...文字列のindexの0番目にhitしてる
"1a17-0011" =~ /[0-9]{3}-[0-9]{4}/   # => nil
"  117-0011" =~ /[0-9]{3}-[0-9]{4}/  # => 2 ...空白があってもマッチする
"  117-0011" =~ /^[0-9]{3}-[0-9]{4}/ # => nil ...^を付けることで行頭からの検索になる

"aaa@aaa.com" =~ /@/      # => 3
"aaa@aaa.com" =~ /com$/   # => 8 ...行末に存在しているか検索
"aaa@aaa.com  " =~ /com$/ # => nil




## ----------- 配列の作り方 ----------
# 空の配列を作成するとして、あとから拡張する
arr = []
arr[0] = "value"

# %w 記法
arr = %w"apple banana cherry" # => ["apple", "banana", "cherry"]

# 文字列を配列に型変換する
"apple banana cherry".split <=> ["apple", "banana", "cherry"].join("")


## ----------- 配列はインデックスで操作する ----------
# 配列[0]    ...配列のインデックス０番目
# 配列[1,2]  ...配列のインデックス１番目から２つ
# 配列[3..5] ...配列のインデックス３番目から５番目

ar = ["aa", "bb", "cc"]
ar[1]    # => "bb"
ar[1,2]  # => ["bb", "cc"]
ar[0..1] # => ["aa", "bb"]


## ----------- 配列を繰り返して、中身を捜査する ----------
ar = %w"aa bb cc dd"
ar.each do |v|
  puts v
end
# => aa bb cc dd

ar.each_with_index do |v,idx|
  puts "インデックス#{idx}番目は #{v} です"
end
# インデックス0番目は aa です
# インデックス1番目は bb です
# インデックス2番目は cc です
# インデックス3番目は dd です


## ----------- 配列を繰り返して、中身を置き換える ----------
# 配列.map! do |x|
# 置き換え式
# end
ar = %w"aa bb cc dd"
ar.map! do |v|
  V + "999"
end
p ar # => ["aa999", "bb999", "cc999", "dd999"]


## ----------- 配列の要素を判定して、条件に一致したものを抽出する ----------
# Hitした１件のみ抽出
# 配列.detect do |x|
# 判定条件式
# end

# Hitした全てを抽出
# 配列.select do |x|
# 判定条件式
# end
ar = %w"apple banana apple orange"
ar.select! do |v|
  v != "apple"
end
p ar # => ["apple", "apple"]


## ----------- 配列から要素を削除する ----------
ar = %w"apple banana apple orange"

# 配列.delete(指定の値)
ar.delete("apple")
p ar # => ["banana", "orange"]

# 配列.delete_at(インデックス番号)
ar.delete_at(1)
p ar # => ["apple", "apple", "orange"]

# 配列.delete_if ブロック条件式
ar.delete_if do |v|
  v == "apple"
end
p ar # => ["banana", "orange"]


## ----------- 配列内の並び替えと反転 ----------
# 配列.sort  ...abc順に並び替える
ar = %w"cherry banana apple orange"
p ar.sort # => ["apple", "banana", "cherry", "orange"]

# 配列.reverse  ...左右反対から読み込まれる（逆順）
p ar.reverse # => ["orange","apple", "banana", "cherry"]

# 配列.sort_by ブロック式   ...特殊な条件での並び替え
ar = %w"aaa bb c dddd"
ar.sort_by! do |v|
  v.size     # 文字数順での並び替え
end
p ar # => ["c","bb", "aaa", "dddd"]


## ----------- 配列をキューやスタックとして扱う ----------
ar = %w"apple banana cherry orange"
# 配列の最後尾から取り出す
v = ar.pop

p v + "を取り出した"
p ar 
# "orangeを取り出した"
# ["apple", "banana", "cherry"]

# 配列の先頭から取り出す
v = ar.shift
p v + "を取り出した"
p ar 
# "appleを取り出した"
# ["banana", "cherry", "orange"]

# 配列の最後尾に追加する
ar.push("coconut")
p ar
# ["apple", "banana", "cherry", "orange", "coconut"]

# 配列の先頭に追加する
ar.unshift("coconut")
p ar
# ["coconut", "apple", "banana", "cherry", "orange"]


## ----------- 配列の演算 -----------
ar1 = %w"apple banana"
ar2 = %w"cherry orange apple"

# 配列 + 配列
p ar1 + ar2 
# ["apple", "banana", "cherry", "orange", "apple"]
# 同じ要素があっても関係なく末尾に付く

# 配列 - 配列
p ar1 + ar2 
# ["banana"]
# 最初の配列で重複されているもののみ削除される

# 配列 << 配列
p ar1 << "coconut"
# ["apple", "banana", "coconut"]
# 末尾にくっつく

# 配列 & 配列
# 集合の積

# 配列 | 配列
# 集合の和

## ----------- その他、便利なメソッド -----------
# 配列.max  ...最大値を取り出す
[1,4,8,10].max
# => 10

# 配列.min  ...最小値を取り出す
[1,4,8,10].min
# => 1

# 配列.sum  ...配列内の合計値を算出する
[1,4,8,10].sum
# => 23

[1,4,8,10,aaa].sum
# => errorになる

# 配列.compact  ...配列内からnilを除去する
[1,4,8,10,nil,nil].compact
# => [1, 4, 8, 10]

# 多次元配列.flatten  ...多次元配列を平坦化する(配列の中に配列があるものを１次元配列にしてくれる)
[ [1,2], [1,3], [4] ].flatten
# => [1, 2, 1, 3, 4]

# 配列.uniq  ...配列から重複を削除する
[1,2,3,1,1,4,2].uniq
# => [1, 2, 3, 4]


## ----------- practice -----------
# 1
a = %w(a b c d e f)
p ???
# => ["c", "d", "e"]

??? = a[2...-1]
# -1 は末尾を指定している
# a[2, 3] や a[2..-2] でも同じ結果が得られる。
# a[start, length]という記述は、配列のstart番目からlength個分の要素を返す

# 2
ary = [1, 2, 3, 4]
p ??? {|item| item ** 2}
# => [1, 4, 9, 16]

??? = ary.collect
# mapメソッドでも同じ結果が得られる。

# 3
ary = %w(a b c d e)
ary.push(ary.shift)  
ary.unshift
p ary
# => [nil, "b", "c", "d", "e", "a"] 正解はこれだが
# => ["b", "c", "d", "e", "a"] VSCodeだとこれで返ってくる(nilだと表示されないのか？)

# 4
order = ['apple', 'grape', 'orange']
stock = ['grape', 'orange', 'banana']
p order & stock
# => ["grape", "orange"]

# 5
[0, 1, 4, 9].??? do |x, y|
  p [x, y]
end
# =>
# [0, 0]
# [1, 1]
# [4, 2]
# [9, 3]

??? = each_with_index

# 6
x = ["Ruby", "Perl", "C"]
puts ???
puts x[0]
# =>
# Ruby
# Ruby

??? = x.first

# x.shift だと
# Ruby
# Perl と出力

# x.shift! だとエラー

# x.unshift　だと
# Ruby
# Perl
# C
# Ruby と出力される

# 7
a = %w(The quick brown fox)
b = %w(jumps over the lazy dog.)
c = a
a.concat(b)
c.compact!
p c
# => ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog."]

# 8
findメソッドと同じ動作をするメソッドは何か？
detectメソッド
配列の各要素に対してブロックを評価し、最初に真となったものを返す。

# 9
ary = [1, 2, 3, 1, 2, 3, 1, 2, 3]
???
p ary
# => [1, 3, 1, 3, 1, 3]

??? = ary.delete(2)
# delete_if {|x| x == 2} でも同じ結果が得られる
# reject は元の配列から要素を削除しない

# 10
p %w(foo bar baz).???
# => ["FOO", "BAR", "BAZ"]

??? = map {|item| item.upcase}
# collect {|item| item.upcase} でも同じ結果が得られる