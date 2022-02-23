Timeクラス
・日付、時刻を表現するクラス
・オブジェクトを生成してから使う

----------- メソッドの呼び出し方 ----------
・インスタンスメソッド
1. クラス名.new でオブジェクトを生成して変数に保存
2. オブジェクトを保存した変数名.メソッド名でメソッド実行

hensu = Time.new  
# => 2022-02-22 21:50:09
hensu.year        
# => 2022


----------- Timeオブジェクトを実体化させる(インスタンスを生成する) ----------
・現在日時のTimeオブジェクトを生成する
Time.new

・架空日時のTimeオブジェクトを生成する
Time.local(年,月,日,時,分,秒)

jikan = Time.new
# => 2020-10-29 21:54:04 +0900  ...教材の時間
jikan2 = Time.local(1999,12,31,23,59,59)
# => 1999-12-31 23:59:59 +0900


----------- 時刻の演算 ----------
+ 秒 ...時刻から指定の秒数を足す
jikan + 3600 
# => 2020-10-29 22:54:04 +0900

- 秒 ...時刻から指定の秒数を引く
jikan - 3600 
# => 2020-10-29 20:54:04 +0900

Timeオブジェクト - Timeオブジェクト ...秒差を計算する
jikan - jikan2
657323645.9696974

----------- 時刻の書式表示 ----------
Timeオブジェクト.strftime(フォーマット)
フォーマット例)
"%Y年%m月%d日 %H時%M分%S秒"
"%Y/%m/%d %H:%M:%S"

jikan.strftime("%Y年%m月%d日 %H:%M")
# => "2020年10月29日 21:54"