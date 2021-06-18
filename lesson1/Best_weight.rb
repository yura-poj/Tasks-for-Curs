#Программа запрашивает у пользователя имя и рост и выводит идеальный вес, после чего выводит результат пользователю на
# экран с обращением по имени. Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"
class Best_weight
  attr_reader :name
  def initialize
    puts'Whats your name'
    @name = gets.chomp
    puts'Whats your height'
    @height = gets.to_i
  end

  def count
    (@height - 110) * 1.15
  end
  def result(res)
    puts "Your weight is optimal" if res < 0
  end
end

User = Best_weight.new
puts "#{User.name}, your best weight is #{User.count}"
User.result(User.count)