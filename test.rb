def janken
  puts "0 (グー)、1 (チョキ)、2 (パー)"

  my_hand = gets.to_i
  pc_hand = rand(3)

  jankens = ["グー", "チョキ","パー",]
  puts "じゃんけん..."
  puts "あなたの手:#{jankens[my_hand]}\相手の手:#{jankens[pc_hand]}"

  win = (my_hand == 0 && pc_hand == 1) || (my_hand == 1 && pc_hand == 2) || (my_hand == 2 && pc_hand == 0)
  lose = (my_hand == 0 && pc_hand == 2) || (my_hand == 1 && pc_hand == 0) || (my_hand == 2 && pc_hand == 1)
  draw = my_hand == pc_hand

   if draw
     puts "あいこで"
     janken
     return true

   elsif win
     @janken_result = "win"
     puts "あなたの勝ちです"
     acchimuite_hoi
     return false

   elsif lose
     @janken_result = "lose"
     puts "あなたの負けです"
     acchimuite_hoi
     return false
   end
end

def acchimuite_hoi
  puts "あっち向いて"
  puts "0 (上)、1 (下)、2 (左)、3 (右)"
  my_face = gets.to_i
  pc_face = rand(4)

  directions = ["上", "下", "左", "右"]
  puts "ホイッ"
  puts "あなたの向き:#{directions[my_face]}\相手の向き:#{directions[pc_face]}"

   if @janken_result == "win" && my_face == pc_face
     puts "あなたの勝ちです"
     exit

   elsif @janken_result == "lose" && my_face == pc_face
     puts "あなたの負けです"
     exit

   else
     puts "じゃんけん..."
     janken
     return true
   end
end

next_game = true
   while next_game do
     next_game = janken
   end