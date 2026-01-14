# frozen_string_literal: true

puts 'Введите свой возраст (целое число):'
age = gets.to_i
puts 'Введите свою страну:'
# .strip обрежет \n
country = gets.strip.downcase
if age >= 21 || (age >= 18 && country != 'япония' && country != 'сша')
  puts 'Доступ открыт'
else
  puts 'Доступ закрыт'
end
