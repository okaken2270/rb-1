# 実行手順
# 1.「cd memo」と入力
# 2.「ruby memo.rb」と入力

# CSVファイルを扱うためのライブラリを読み込んでいます
require "csv" 
 
 puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

 
 # ユーザーの入力値を取得し、数字へ変換しています
 memo_type = gets.to_s 
 puts "選択：" + memo_type
 input_number = memo_type.chomp
 
 #1を押したとき
 if  input_number == "1"
 puts"新規ファイルを作成します。ファイル名を記入してください。"

 
 file_name_new = gets.chomp
 puts "タイトル：" + file_name_new
 
 puts"メモの内容を記入して下さい。入力後はCtrl + D で保存"

 #参考サイト　https://qiita.com/ayaka-k/questions/bb8ff2193f8f9dd1f071
 imput_memo = STDIN.read
 memo = imput_memo.chomp

 # 保存ができているか確認をするためのコード
 # puts "#{memo}"
 
 CSV.open("#{file_name_new}.csv","w") do |csv|
 csv.puts ["#{memo}"]
 
end

puts "保存したので終了致します。"

 
 #2を押したとき
 elsif  input_number == "2"

 puts"既存のファイルを編集します。"
 puts"ファイル名を入力してください。"

 file_name = gets.chomp
 
 begin

 puts"指定したファイルの編集を開始します。"

 
 file = File.open("#{file_name}.csv", "a")
 
 imput_memo = gets.chomp
 memo = imput_memo.chomp
 
 file.write("#{memo}")
 file.close
 
 
 puts"編集を保存して終了します。"
 
 rescue
 
 puts"該当するファイルが特定できません。処理を終了します。"

 end
 
 puts "終了"
 
 end

 # SCVについてhttps://style.potepan.com/articles/27115.html
 # gets メソッドについて　https://pikawaka.com/ruby/gets
 #参考サイト：https://dosezen.com/2020/04/13/skillhacks-ruby-memo-app/