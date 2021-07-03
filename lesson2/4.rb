# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
vowels = {}
('a'..'z').to_a.each_with_index { |letter, i| vowels[letter] = i + 1 if 'aeiuo'.include?(letter) }
puts vowels.inspect
