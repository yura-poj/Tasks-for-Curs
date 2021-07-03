# Сделать хеш, содержащий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30
months = %i[January February March April May June July August September October November December]
days = []
hash = {}
4.times do
  days.push(31)
  days.push(30)
end
days[-1] = 31
days[1] = 28
2.times do
  days.push(30)
  days.push(31)
end
(0..11).to_a.each { |a| hash[months[a]] = days[a] }
hash.each { |month, days| puts month if days == 30 }
