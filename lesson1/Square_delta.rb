#Программа должна запрашивать основание и высоту треугольника и возвращать его площадь.
class Square_delta
  def initialize
    puts 'Whats your side'
    @a =gets.to_f
    puts 'Whats your height'
    @h = gets.to_f
  end
  def count
    @a * @h / 2
  end
end

User = Square_delta.new
puts "Square of delta = #{User.count}"
