#Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
class Basket
  def initialize
    @basket = {}
    @sum = 0
  end
  def add_goods(title, price, number)
    @basket[title] = {price => number}
  end
  def pay
    puts @basket.inspect
    @basket.each do |title, hash|
      price = 0
      number = 0
      hash.each { |a, b| price = a; number = b}
      puts "#{title} - #{price * number}"
      @sum += price * number
    end

    puts "Total - #@sum"
  end
end

User = Basket.new

loop do
  puts "title:"
  title = gets.chomp

  break if title == 'stop'

  puts "price"
  price = gets.to_i
  puts "number"
  number = gets.to_i

  User.add_goods(title, price, number)
end

User.pay
