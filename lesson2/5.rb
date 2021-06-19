#Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты,
# начиная отсчет с начала года. Учесть, что год может быть високосным.
class Count_day
  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
    @days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @sum = 0
  end
  def main
    @days[1] = 29 if leap_year?

    @sum = @day
    @days.slice(0, @month - 1).each { |a| @sum += a  }
    puts @sum
  end
  def leap_year?()
    @year % 4 == 0 && (@year % 100 != 0 or @year % 400 == 0)
  end
end

puts 'day:'
day = gets.to_i
puts 'month:'
month = gets.to_i
puts 'year:'
year = gets.to_i

User = Count_day.new(day, month, year)
User.main
