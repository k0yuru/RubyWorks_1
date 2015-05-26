require "sinatra"
require "sinatra/reloader"

# cssの定義
get "/money.css" do
  %!
  body {
  background-color : #fffafa;
  }
  caption{
  font-weight:bold;
  margin-bottom:3px;
  }
  table{
  border-collapse: collapse;
  }
  table th{
  width: 20%;
  padding: 6px;
  text-align: left;
  vertical-align: top;
  color: #333;
  background-color: #eee;
  border: 1px solid #b9b9b9;
  }
  table td{
  padding: 6px;
  background-color: #fff;
  border: 1px solid #b9b9b9;
  }
  !
end

#トップページ
get "/" do

sum = 0
file = open("wallet_date.txt", "r")

html = %!
<html>
<head>
<link rel="stylesheet" type="text/css" href="money.css">
</head>
<body>
  <form action="/cash" method="post">
    ひにち　 <input type="text" name="date"><br>
    こうもく <input type="text" name="content"><br>
    いくら？ <input type="text" name="number"><br><br>
    <input type="submit" value="とうろく">
  </form><br>
!

html = html + %!
<caption>おこづかい帳</caption>
　  <table class="mono">
    <tbody>
　　　<tr>
　　　<th scope="col">ひにち</th>
　　　<th scope="col">こうもく</th>
     <th scope="col">ふえた</th>
     <th scope="col">へった</th>
     <th scope="col">ごうけい</th>
　　　</tr>
!

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
html = html + %!
　　　<tr>
　　　<td>#{money[0]}</td>
     <td>#{money[1]}</td>
　　　<td>#{plus}</td>
     <td>#{minus}</td>
     <td>#{sum}</td>
     </tr>
!
end

html = html + %!
   </tbody>
　　</table>
  </body>
</html>
!

end


# post後ページ
post "/cash" do
sum = 0

  new_item = "#{params["date"]},#{params["content"]},#{params["number"]}"
  file = open("wallet_date.txt", "a")
  file.puts new_item
  file.close

file = open("wallet_date.txt", "r")

  html = %!
  <html>
  <head>
  <link rel="stylesheet" type="text/css" href="money.css">
  </head>
  <body>
  <a href="http://localhost:4567/">続けて入力する</a><br><br>
     <caption>おこづかい帳</caption>
  　  <table class="mono">
      <tbody>
  　　　<tr>
  　　　<th scope="col">ひにち</th>
  　　　<th scope="col">こうもく</th>
       <th scope="col">ふえた</th>
       <th scope="col">へった</th>
       <th scope="col">ごうけい</th>
  　　　</tr>
  !

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
html = html + %!
  <tr>
  <td>#{money[0]}</td>
  <td>#{money[1]}</td>
  <td>#{plus}</td>
  <td>#{minus}</td>
  <td>#{sum}</td>
  </tr>
!
end

html = html + %!
   </tbody>
　　</table>
  </body>
</html>
!

end
