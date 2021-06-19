#Заполнить массив числами от 10 до 100 с шагом 5
arr = (2..20).to_a.map{ |a| a * 5 }
puts arr.inspect