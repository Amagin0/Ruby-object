``` ruby
num = 3.555

num.round    # => 4...四捨五入
num.floor    # => 3...切り下げ
num.ceil     # => 4...切り上げ
num.truncate # => 3...切り捨て

数字.zero? # ゼロかどうかの判定(true/false)
数字.odd?  # 奇数かどうかの判定(true/false)
数字.even? # 偶数かどうかの判定(true/false)

Math::PI  πを表す定数
3 * 3 * Math::PI 
# => 28.274333882308138

Math.sqrt  平方根を求めるクラスメソッド
Math.sqrt(4) 
# => 2

# 整数を扱う
Integer => Fixnum,Bignum
# 小数点を扱う
Float

"3.33".to_i # 3になってしまう
"3.33".to_f # 3.33で出力
```

'' と ""の違い
------------------
``` ruby
puts '#{3+4}'   
puts "#{3+4}" 
```

実行結果
``` ruby
#{3+4}  # 忠実に実行してくれる
7       # 内側の計算式や変数を展開してくれる
```

ヒアドキュメント<<識別子
------------------
``` ruby
hensu = <<FIN
ここから


ここまで
FIN
```
実行結果
``` ruby
"ここから\n\n\nここまで\n"
# 識別子が行頭に現れるまで、その内側がドキュメントになる
```

文字列の演算子
------------------
文字列 + 文字列
``` ruby
"abc" + "xyz"  
# => "abcxyz" 
# 文字列を連結する
```

文字列 * 数値
``` ruby
"abc" * 3 
# => "abcabcabc"  
# 文字列を数値文繰り返す
```

文字列 % 書式
``` ruby
"%10s" % "abc" #%10s 10個分のスペース
# => "          abc" 
# 書式通りの文字列にする
```

文字列A << 文字列B
``` ruby
"abc" << "xyz" 
# => "abcxyz" 
# 文字列Bを文字列Aに付け加える
```

足し算との違い
``` ruby
a = "abc"
x = "xyz"
c = a + x 
# => "abcxyz"

puts c 
# => abcxyz

a << x
puts a 
# => "abcxyz" 
# 足し算は中身が変化しないのに対し、<< は中身が変わる
```

文字列 =~ 正規表現
-----------
文字列を正規表現Regexpで一致判定を行う
``` ruby
"aaa@aaa.com" =~ /@/ 
# => 3 
# @は0.1.2.3の3にあるため
```

文字列の長さを求める(length, size)
----------
``` ruby
"abc".size # => 3
"abc".length # => 3
```

文字列のインデックス操作([]演算子)
----------
``` ruby
str = "abcde"
str[3] 
str[3] = "z" 
str[0..2]
str[0,3] 
```

実行結果
``` ruby
"d"
"abcze" # dがzに変換されている
"abc"
"abc"
```

文字列の変換・置き換え(sub, gsub, sub!, gsub!) g...global  
------------------
``` ruby
str = "abababcd"

# 文字列.sub or 文字列.gsub(/変換したい文字列/,"置き換えたい文字列")
str.sub(/ab/,"xy") 
str.gsub(/ab/,"xy") 

# !は破壊的メソッド。元の変数が変化する
str.sub!(/ab/,"xy")
str.gsub!(/cd/,"xy") 
```

実行結果
``` ruby
"xyababcd"
"xyxyxycd"

"xyababcd"
"xyababxy"  # 前述でab が xy に変わっているため
```

文字列の検索(index, rindex)...検索してマッチしたインデックス番号を返す  
------------------ 
文字列.index(検索したい文字列)
``` ruby
"abcde".index("de") # => 3
```

指定文字の削除(delete, delete!)
------------------
文字列.delete(削除したい文字列)
``` ruby
"abcde".delete("cd") # => "abe"
"abcde".delete("ac") # => "bde" 指定した文字を消すので順番は関係ない
```

文字列の行末の削除(chop, chomp)
------------------
文字列.chop
``` ruby
"abcde".chop # => "abcd"
```

文字列.chomp
``` ruby
"abcde".chomp("e") # => "abcd"
```

文字列.chomp(削除したい行末文字列)
``` ruby
"abcde\n".chomp # => "abcde"
```

型変換：文字列　の分割して配列を作成する(split ←→ join)
------------------
文字列.split   空白もしくは指定文字列を区切りとして、文字列から配列を作成
``` ruby
"aa bb cc".split # => ["aa", "bb", "cc"]
```

文字列.split(",")
``` ruby
"aa,bb,cc".split(",") # => ["aa", "bb", "cc"]
```

文字列.join   指定文字列を区切りとして、配列から文字列を作成
``` ruby
ar = ["aa", "bb", "cc"]
ar.join 
# => "aabbcc"
```

文字列.join(",")
``` ruby
ar.join(",") # => "aa,bb,cc"
```

文字列のその他メソッド
----------------
文字列.upcase
``` ruby
"abc".upcase # => "ABC"
```

文字列.downcase
``` ruby
"ABC".downcase # => "abc"
```

文字列.reverse
``` ruby
"abc".reverse # => "cba"
```

文字列.slice(範囲)
``` ruby
"abcde".slice(2..3) # => "cd"　
# 指定した範囲を切り取ってくれる
```

文字列.strip
``` ruby
"  abc  ".strip # => "abc"  
# 前後のスペースを除去してくれる
```
  
演習問題(その１)
----------------
問1  
以下の選択肢のコードの中から、**実行時にエラーとなるもの** を選択してください。
``` ruby
puts "foo" + "bar"
puts "foo" - "bar"
puts "foo" * 3
puts "%x" % 255
```

<details><summary>解答</summary>

``` ruby
puts "foo" - "bar"
```
</details>
<br>  

問2  
以下のコードを実行したときの結果として、**正しいもの** を答えてください。  
``` ruby
puts "ABCDEF"[3...-1]
```
<details><summary>解答</summary>

``` ruby
DE
```
</details>
<br>

問3  
以下のコードは "/ruby/exam/index.html" という文字列中で3番目に出現する「/」の位置(文字列中で何文字目か)を出力します。  
「○○○○○」に入る **適切な記述** を選択してください。  
``` ruby
s = "/ruby/exam/index.html"
puts 「○○○○○」
```
``` ruby
s.index("/", 2)
s.index("/", 3)
s.index("/", 10)
s.index("/", 11)
```
<details><summary>解答</summary>

``` ruby
s.index("/", 3)
```
</details>
<br>

問4  
以下のような出力にコードがあります。  
「○○○○○」に入る記述として **適切ではないもの** を選択してください。  
``` ruby
str = "abcdef"
「○○○○○」
puts str 
```
``` ruby
str[2..5] = "ba"
str[2, 5] = "ba"
str[/[cdef]+/] = "ba"
str["cdef"] = "ba"
str[ab(cdef)] = "ba"
```

出力結果
``` ruby
abba
```
<details><summary>解答</summary>

``` ruby
str[ab(cdef)] = "ba"
```
</details>
<br>

問5  
以下のコードを実行したときの結果として **正しいもの** を答えてください。  
``` ruby
puts "0123456789-".delete("0-28-")
```
<details><summary>解答</summary>

``` ruby
345679
# "0-2" と "8-" で分けて考える
# "8-" は "8" と "-" を指定している
```
</details>
<br>

問6  
以下のコードを実行したときの結果として **正しいもの** を答えてください。
``` ruby
p "foo\nbar\nbaz".split(/\n/, 2)
```
<details><summary>解答</summary>

``` ruby
["foo", "bar\nbaz"]
```
</details>
<br>

問7  
以下のコードを実行したときの結果として正しいものを答えてください。  
``` ruby
str = "abc\r\n\r\n".chomp('')
p str
```
<details><summary>解答</summary>

``` ruby
"abc"
# \r は \n と同じ意味
# 引数を省略した場合は、通常の改行コードの "\r", "\n", "\rn" を取り除くことが出来る
# 引数に空文字 '' を指定すると、末尾の連続する改行コードを全て取り除く
```
</details>
<br>

問8  
以下のコードを実行したときの結果として正しいものを答えてください。  
``` ruby
str = "abc\r\n".chop
p str
```
<details><summary>解答</summary>

``` ruby
"abc"
# \r\n を改行コード１文字と認識するため
```
</details>
<br>

演習問題(その２)
----------------
問1  
以下のような出力になるコードがあります。  
「○○○○○」に入る適切な記述を選択してください。
``` ruby
x = [1, 2, 3, 4, 5]
y = [3, 4, 5, 6]
p 「○○○○○」

(x + y) - (x * y)
(x | y) - (x & y)
(x - y).abs
(y - x).abs
(x / y) * [6] * [6]
```

出力結果
``` ruby
[1, 2, 6]
```
<details><summary>解答</summary>

``` ruby
(x | y) - (x & y)  
# - は差集合。左辺の要素から右辺の要素を取り除いた配列を返します。  
# & は積演算。2つの配列に共通する要素を持つ配列を返します。  
# | は和集合。2つの配列の要素をすべてもつ配列を返します。しかし、重複は取り除かれます。  
# + は単純な連結になります。
```
</details>
<br>

問2  
以下のコードを実行したときの出力として正しいものを答えてください。  
``` ruby
[0, 1, 2, 3, 4, 5].detect do |x|
  x > 2
end
```
<details><summary>解答</summary>

``` ruby
3
# Array#detect 及び Array#find は配列の各要素に対してブロックを評価し、最初に真となった要素を返します。
# Array#select 及び Array#find_all は真となった要素すべてを含む配列を返します。
```
</details>
<br>

問3  
以下の実行結果になるコードがあります。「○○○○○」に入る適切な記述を選択してください。  
``` ruby
a = [1, 2, 4, 8, 16, 32]
p 「○○○○○」

a.slice(2,3)
a.slice(3,4)
fetch(2,4)
collect(2,3)
```

出力結果
``` ruby
[4, 8, 16]
```
<details><summary>解答</summary>

``` ruby
a.slice(2,3)
# このメソッドは配列の一部分を返します。引数にはインデックス番号でスタート位置と、その位置からの個数を指定します。
# a[2, 3] と同じ実行結果が得られます。
```
</details>
<br>

問4  
以下のコードを実行したときの結果として正しいものを答えてください。  
``` ruby
a = [1, 2, 3, 4, "go"]
a.join(",")
p a
```
<details><summary>解答</summary>

``` ruby
[1, 2, 3, 4, "go"]
# Array#join メソッドは、配列の各要素を指定した区切り文字を使用して連結した文字列を返します。数値などの文字列以外のものは文字列に変換されて連結されます。
# このコードでは join メソッドを呼び出していますが、 join メソッドは実行結果を「返す」だけで、もとの変数を「破壊的に書き換える」ことはしません。
```
</details>
<br>

問5  
以下のコードを実行したときの出力として正しいものを答えてください。  
``` ruby
a =  [1, 3, 5]
a[5] = 13
a.push(7)
a.shift
a.pop
p a
```
<details><summary>解答</summary>

``` ruby
[3, 5, nil, nil, 13]
# 配列の末尾を超えたインデックスを指定して値を代入すると、配列は自動的に拡張されます。間の要素には nil がセットされます。
```
</details>
<br>

問6  
以下のコードを実行したときの結果として正しいものを答えてください。  
``` ruby
ary1 = ["Windows", "MacOS", "Solaris", "Linux"]
ary2 = ["MacOS", "Linux", "FreeBSD"]
p ary1 - ary2
```

<details><summary>解答</summary>

``` ruby
["Windows", "Solaris"]
# Rubyでは配列を集合して扱い、2つの配列に対して & , | , - , + の演算子を適用できます。 / は未定義でエラーとなります。
# & は共通部分の取り出し、 | は集合の和、 - は集合の差、 + は配列の連結を行います。
```
</details>
<br>

問7  
以下の実行結果になるコードがあります。「○○○○○」に入る適切な記述を選択してください。  
``` ruby
a = [1, 2, 3, 4, 5]
「○○○○○」

a[3...4]
a[2...3]
a[2..3]
a[3..4]
a[3..2]
```
出力結果  
``` ruby
[3, 4]
```
<details><summary>解答</summary>

``` ruby
a[2..3]
# 範囲を指定して取り出すことが出来ます。
# a[2, 2] と同じ実行結果が得られます。
# いずれもインデックス位置を指定します。
```
</details>
<br>

問8  
以下のコードを実行したときの結果として正しいものを答えてください。  
``` ruby
a = [1, 3, 5, 7, 11]
a.delete(2)
a.delete(1)
p a
```
<details><summary>解答</summary>

``` ruby
[3, 5, 7, 11]
# Array#delete メソッドは、指定した値と同じ値を配列内から削除する破壊的なメソッドです。存在しない値を指定してもなにも変化しません。
# なお、 Array#delete_at メソッドはインデックス番号を指定して、そのインデックスにある値を削除します。Array#delete_if メソッドはブロックを評価し、マッチした値を削除します。
```
</details>
<br>

問9  
以下の実行結果になるコードがあります。「○○○○○」に入る適切な記述を選択してください。  
``` ruby
ary1 = ["Windows", "MacOS", "Solaris"]
ary2 = ["MacOS", "Linux"]

p ary1 + ary2
p ary1 - ary2
p ary1 | ary2
p ary1 & ary2
```
出力結果  
``` ruby
["Windows", "MacOS", "Solaris", "Linux"]
```
<details><summary>解答</summary>

``` ruby
p ary1 | ary2  
# Rubyでは配列を集合して扱い、2つの配列に対して & , | , - , + の演算子を適用できます。 / は未定義でエラーとなります。
# & は共通部分の取り出し、 | は集合の和、 - は集合の差、 + は配列の連結を行い重複した値はそのままとなります。
```
</details>
<br>

問10  
以下のコードを実行したときの結果として正しいものを答えてください。  
``` ruby
p [0, 1, 2, 3, 4, 5].detect do |x|
  x > 3
end
```
<details><summary>解答</summary>

``` ruby
4
# Array#detect メソッドは Array#find メソッドと同じ実行結果が得られます。配列の各要素に対してブロックを評価し「最初に」真となった値を返します。
# なお、 Array#find_all メソッドと Array#select メソッドは、配列の各要素に対してブロックを評価し、真となった値を配列として「すべて」返します。
```
</details>