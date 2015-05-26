sum = 0
contents = ["日付", "項目", "入金", "出金", "合計"]
file = open("wallet_date.txt", "r")

print contents.join("\t"), "\n"

while not file.eof?
  money = file.gets.split(',')
  num = money[2].to_i
    if num > 0
       plus = num
       minus = 0
    else
       plus = 0
       minus = - num
    end
    sum = sum + num
    result = [money[0], money[1], plus, minus, sum]
    print result.join("\t"), "\n"
end

file.close
