require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_s

puts "選択：" + memo_type
input_number = memo_type.chomp


if input_number == "1"
puts "拡張子を除いたファイルを入力してください"
file_name = gets.chomp

puts"メモの内容を記入して下さい。完了したらCtrl+Dをおします"
imput_memo = STDIN.read
memo = imput_memo.chomp

CSV.open("#{file_name}.csv" , "a") do |csv|
csv.puts ["#{memo}"]
end

elsif input_number == "2"
puts "拡張子を除いた既存ファイル名を入力してください"


else
puts "1か2の数字を入力してください"
end
