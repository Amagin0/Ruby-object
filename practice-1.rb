num = 3.555

num.round    # => 4...四捨五入
num.floor    # => 3...切り下げ
num.ceil     # => 4...切り上げ
num.truncate # => 3...切り捨て

数字.zero? # ゼロかどうかの判定(true/false)
数字.odd?  # 奇数かどうかの判定(true/false)
数字.even? # 偶数かどうかの判定(true/false)

# Math::PI  πを表す定数
3 * 3 * Math::PI # => 28.274333882308138

# Math.sqrt  平方根を求めるクラスメソッド
Math.sqrt(4) # => 2

# 整数を扱う
Integer => Fixnum,Bignum
# 小数点を扱う
Float

"3.33".to_i # 3になってしまう
"3.33".to_f # 3.33で出力


# ---------'' と ""の違い---------
puts '忠実に実行してくれる。 #{3+4}' # #{3+4}と表示
puts "忖度して先回りしてくれる。#{3+4}" # 7と表示...内側の計算式や変数を展開してくれる


# ---------ヒアドキュメント<<識別子---------
hensu = <<FIN
ここから


ここまで
FIN
# => "ここから\n\n\nここまで\n"
# 識別子が行頭に現れるまで、その内側がドキュメントになる


# ---------文字列の演算子---------
# 文字列 + 文字列
"abc" + "xyz"  # => "abcxyz" # 文字列を連結する

# 文字列 * 数値
"abc" * 3 # => "abcabcabc"  # 文字列を数値文繰り返す

# 文字列 % 書式
"%10s" % "abc" #%10s 10個分のスペース
# => "          abc" # 書式通りの文字列にする

# 文字列A << 文字列B
"abc" << "xyz" # => "abcxyz" # 文字列Bを文字列Aに付け加える

# 足し算との違い
a = "abc"
x = "xyz"
c = a + x # => "abcxyz"
puts c # => abcxyz

a << x
puts a # => "abcxyz" # 足し算は中身が変化しないのに対し、<< は中身が変わる


# ---------文字列 =~ 正規表現---------
# 文字列を正規表現Regexpで一致判定を行う
"aaa@aaa.com" =~ /@/ # => 3 # @は0.1.2.3の3にあるため


# ---------文字列の長さを求める(length, size)---------
"abc".size # => 3
"abc".length # => 3


# ---------文字列のインデックス操作([]演算子)---------
str = "abcde"
str[3] # => "d"
str[3] = "z" # => "abcze" ...dがzに変換されている
str[0..2] # => "abc"
str[0,3] # => "abc"


# ---------文字列の変換・置き換え(sub, gsub, sub!, gsub!) g...global---------
str = "abababcd"

# 文字列.sub or 文字列.gsub(/変換したい文字列/,"置き換えたい文字列")
str.sub(/ab/,"xy") # => "xyababcd" 
str.gsub(/ab/,"xy") # => "xyxyxycd" 

# !は破壊的メソッド。元の変数が変化する
str.sub!(/ab/,"xy") # => "xyababcd" 
str.gsub!(/cd/,"xy") # => "xyababxy"  ...前述でab が xy に変わっているため


# ---------文字列の検索(index, rindex)--------- 
# 検索してマッチしたインデックス番号を返す
# 文字列.index(検索したい文字列)
"abcde".index("de") # => 3


# ---------指定文字の削除(delete, delete!)---------
# 文字列.delete(削除したい文字列)
"abcde".delete("cd") # => "abe"
"abcde".delete("ac") # => "bde" 指定した文字を消すので順番は関係ない


# ---------文字列の行末の削除(chop, chomp)---------
# 文字列.chop
"abcde".chop # => "abcd"

# 文字列.chomp
"abcde".chomp("e") # => "abcd"

# 文字列.chomp(削除したい行末文字列)
"abcde\n".chomp # => "abcde"


# ---------型変換：文字列　の分割して配列を作成する(split ←→ join)---------
# 文字列.split   空白もしくは指定文字列を区切りとして、文字列から配列を作成
"aa bb cc".split # => ["aa", "bb", "cc"]

# 文字列.split(",")
"aa,bb,cc".split(",") # => ["aa", "bb", "cc"]

# 文字列.join   指定文字列を区切りとして、配列から文字列を作成
ar = ["aa", "bb", "cc"]
ar.join # => "aabbcc"

# 文字列.join(",")
ar.join(",") # => "aa,bb,cc"


# --------文字列のその他メソッド--------
# 文字列.upcase
"abc".upcase # => "ABC"

# 文字列.downcase
"ABC".downcase # => "abc"

# 文字列.reverse
"abc".reverse # => "cba"

# 文字列.slice(範囲)
"abcde".slice(2..3) # => "cd"　指定した範囲を切り取ってくれる

# 文字列.strip
"  abc  ".strip # => "abc"  前後のスペースを除去してくれる


# --------practice--------
# 1
puts "ABCDEF"[3...-1] # => DE

# 2
s = "/ruby/exam/index.html" # 3番目に出現する「/」の位置(文字列中で何文字目か)を出力する
puts ?? # => s.index("/", 3)

# 3
str = "abcdef"
??? # => str[ab(cdef)] = "ba"  「エラーが出るので本当に正しいのか？」
puts str # abba

# 4
puts "0123456789-".delete("0-28-")
# => "345679"  0,1,2 と 8,- が削除される

# 5
p "foo\nbar\nbaz".split(/\n/, 2) # => ["foo", "bar\nbaz"]

# 6
str = "abc\r\n\r\n".chomp('')
p str # => "abc"  \r は \n と同じ

# 7
str = "abc\r\n".chop
p str # => "abc"  \r\n を改行コード１文字と認識するため