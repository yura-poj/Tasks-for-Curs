class Quadratic_equation
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  def D
    d = @b ** 2 - 4 * @a * @c
    puts "D = #{d}"
    if d > 0
      puts "x1 = #{root(d, 1)}"
      if d != 0
        puts "x2 = #{root(d, -1)}"
      end
    else
      puts "equation dont have roots"
    end
  end
  def root(d, value)
    (Math.sqrt(d) * value - @b) / (2 * @a)
  end
end

puts 'a:'
a = gets.to_i
puts 'b:'
b = gets.to_i
puts 'c:'
c = gets.to_i
User = Quadratic_equation.new(a, b, c)
User.D