puts "Hello, world!"

point = 0
for point in 1..10
  point += 1
  puts [ "点数：", point ]
   if point > 7
     break
     puts "You're winner!"
   end
end
