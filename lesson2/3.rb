# Заполнить массив числами фибоначчи до 100
fib = [0, 1]
a = 1
while a <= 100
  fib.push(a)
  a = fib[-2] + fib[-1]
end

puts fib.inspect
