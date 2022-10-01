require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_s.chomp

if memo_type == "1"
    puts "ファイルを入力(拡張子を除く)"
    file_name = gets.to_s.chomp
    puts "メモ内容を入力し、enterキーを入力して下さい"
    puts "完了したらCtrl+Dを入力して下さい"
    file_contents = readlines.map(&:chomp) 
    CSV.open("#{file_name}.csv","w") do |csv|
    csv << [file_contents]      
    end
elsif memo_type == "2"
    puts "1(ファイルの参照) 2(ファイルへの書き込み)"   
    file_edit = gets.to_s.chomp
    if file_edit == "1"
        puts "ファイル名を入力(拡張子を除く)"
        file_name = gets.to_s.chomp
        puts CSV.read("#{file_name}.csv")
    elsif  file_edit == "2"
        puts "ファイル名を入力(拡張子を除く)"
        file_name = gets.to_s.chomp
        puts "メモ内容"
        file_contents = gets.to_s
        CSV.open("#{file_name}.csv","a") do |csv|
        csv << [file_contents]
        end
    else
        puts "エラー"
    end    
else
    puts "エラー"
end