インスタンスメソッド
・文字列クラスや配列クラスでは、データ(インスタンスオブジェクト)をレシーバーにしてメソッドを呼び出していた。

クラスメソッド
・File クラスや Dir クラスでは、クラス名をレシーバーに指定してメソッドを呼び出す。

File クラスや Dir クラスとは
・ファイルやディレクトリ(フォルダ)をプログラムで操作するためのクラス
・これによって、ファイルに書き込んだり、ディレクトリを作ったり、プログラムで自動化できる



----------- ファイルパスを解析する ----------
・ ファイル名を取り出す
# File.basename("ファイルパス")
path = "/aaa/bbb/ccc.txt"
File.basename(path)
# => "ccc.txt"


・ ディレクトリパスを取り出す
# File.dirname("ファイルパス")
File.dirname(path)
# => "/aaa/bbb"


・ ファイルの拡張子を取り出す
# File.extname("ファイルパス")
File.extname(path)
# => ".txt"


----------- ファイルパスを加工する ----------
・ ファイルとディレクトリパスで分割して配列に格納する
# File.split("ファイルパス")
File.split(path)
# => ["/aaa/bbb", "ccc.txt"]


・ 引数の文字列を全て結合してファイルパスを作る
# File.join(文字列1, 文字列2, 文字列3, ....)
File.join("zzz", "xxx", "yyy.txt")
# => "zzz/xxx/yyy.txt"



----------- ファイルを操作する ----------
・ ファイルの一覧を取得する(配列で受け取る)
# Dir.glob("ディレクトリパス")
Dir.glob("/tmp/ruby/*")
# => ["/tmp/ruby/readme2.txt", "/tmp/ruby/readme1.txt"]  ...左は例。実際は置いてあるファイルが表示される


・ ファイルの名前を変える
# File.rename("ファイルパス", "変更後のファイル名")
File.rename("readme2.txt", "aaa")
Dir.glob("/tmp/ruby/*")
# => ["/tmp/ruby/readme2.txt", "/tmp/ruby/aaa"]   ...raedme1.txtがaaaに変わっている


・ ファイルを移動する
# File.rename("ファイルパス", "移動後のディレクトリパス")


・ ファイルを削除する
# File.delete("ファイルパス")
File.delete("aaa")
Dir.glob("/tmp/ruby/*")
# => ["/tmp/ruby/readme2.txt"]   ...aaaが削除されている



----------- ディレクトリを操作する ----------
・ディレクトリを(プログラムが)移動する
・現在のディレクトリパスを表示する
# Dir.chdir("移動するディレクトリパス")
# Dir.pwd
Dir.chdir("../")   # 一つ前に戻る
Dir.pwd
# => "/tmp"

Dir.chdir("./ruby/")
Dir.pwd
# => "/tmp/ruby"

・ディレクトリを作成する
# Dir.mkdir("ディレクトリパス")
Dir.mkdir("zzz/")
Dir.glob("/tmp/ruby/*")
# => ["/tmp/ruby/readme2.txt", "/tmp/ruby/zzz"]    ....zzzが作られている

・ディレクトリを削除する
# Dir.rmdir("ディレクトリパス")
Dir.rmdir("./zzz/")
Dir.glob("/tmp/ruby/*")
# => ["/tmp/ruby/readme2.txt"]    ....zzzが削除されている



----------- ファイルの中身を読む、ファイルに書き込む ----------
# File.open("ファイルパス", "モード") do |ブロック変数|
  ファイル操作の処理を記述する
end
# モード..."r" 読みだしモード。"w" 新規書き込みモード。"a" 追加書き込みモード。

# Ruby
Dir.chdir("./ruby/")
pwd = Dir.pwd
puts "現在の場所は #{pwd} です"

file = Dir.glob("#{pwd}/*")
file = file[0]
puts "#{file} というファイルが存在しました"
puts "このファイルに書き込んでみます"

File.open(file, "w") do |io|
  io.puts "こんにちは"
end
puts "書き込み終わりました"

puts "中身を読み込んで表示してみます"
File.open(file,"r") do |io|
  puts "中身===>" + io.read
end
exit

# 実行結果
現在の場所は /tmp/tuby です。
/tmp/ruby/readme1.txt というファイルが存在しました
このファイルに書き込んでみます
書き込みが終了しました
中身を読み込んで表示してみます
中身===> こんにちは



----------- 練習問題 ----------
# 1
p File.dirname("/usr/lib/sudo")
# => "/user/lib"

# 2
ファイル foo の内容を読み込み、その内容をすべて大文字に変換した上でファイル foo の末尾に追記するプログラムがあります。
???に入る適切な記述を選択してください。

open("foo", ??? ) do |f|
  f.write(f.read.upcase)
end

??? = "r+"  ....読み書き両用モード
# "w+" はファイルをオープンする際にファイルを空にして新規に書き込む。

# 3
カレントディレクトリ内の 特定のワイルドカードに一致するファイルを一覧として取得して表示するコードがあります。
???に入る適切な記述を選択してください。

files = ???
files.each {|file| puts file}

??? = Dir.glob("*.txt")

# Dir#glob メソッドにブロックを渡して次のように記述することもできる。
Dir.glob("*.txt") do |file|
  puts file
end

# 4
ファイル foo の内容を読み込み、その内容をすべて大文字に変換して置き換えるプログラムがあります。
???に入る適切な記述を選択してください。

open("foo", ??? ) do |f|
  content = f.read
  f.rewind
  f.write(content.upcase)
end

??? = "r+"
# 読み書き両用モードでファイルを開く必要がある。
# "a+" は既存のものをそのままに残して、末尾に追記書き込みします。

# 5
p File.???("", "etc", "ruby")
# => "/etc/ruby"

??? = join