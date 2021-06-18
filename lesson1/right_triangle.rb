# Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник прямоугольным (используя теорему Пифагора www-formula.ru), равнобедренным (т.е. у него равны любые 2 стороны)  или равносторонним (все 3 стороны равны) и выводит результат на экран.
class Right_triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  def main
    puts'Triagle is:'
    check_isosceles

    if @a == @b && @b == @c
      puts 'equilateral'
    else
      @a **= 2
      @b **= 2
      @c **=2
      check90
    end

  end
  def check_isosceles
    if @a == @b or @a == @c or @b == @c
      puts 'isosceles'
    end
  end
  def check90
    if @a == @b + @c or @b == @a +@c or @c == @a + @b
      puts 'right triangle'
    end
  end
end


puts'side a'
a = gets.to_i
puts'side b'
b = gets.to_i
puts'side c'
c = gets.to_i
User = Right_triangle.new(a, b, c)
User.main