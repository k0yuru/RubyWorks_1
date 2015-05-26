

while true

print "グーは0, チョキは1, パーは2 を入力してください: "
my = gets.to_i
com = rand(3)

  if com == 0
    comp = "グー"
  elsif com == 1
    comp = "チョキ"
  else com == 2
    comp = "パー"
  end
print "コンピュータ: ", comp, "\n"

  if my == 0
    mine = "グー"
  elsif my == 1
    mine = "チョキ"
  elsif my == 2
    mine = "パー"
  else
    puts "グーかチョキかパーを出してください"
    exit
  end
print "あなた　　　: ", mine, "\n"

  if com - my == 0
    puts "勝敗　　　　: 引き分け"
  elsif (com == 0 && my == 2)||(com == 1 && my == 0)||(com == 2 && my == 1)
    puts "勝敗　　　　: あなたの勝ち"
  else
    puts "勝敗　　　　: コンピュータの勝ち"
end
end
