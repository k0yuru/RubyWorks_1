sum = 0
count = 0
file = open("datal.txt", "r")

while not file.eof?
  n = file.gets.to_f
  sum = sum + n
  count = count + 1
end

file.close
puts "合計 = #{sum}"
puts "平均 = #{sum / count}"
