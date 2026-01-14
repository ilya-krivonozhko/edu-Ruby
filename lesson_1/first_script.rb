# frozen_string_literal: true

coin = 5
puts coin
coin = 10
puts coin
coin += 10
puts coin

# single line comment
#
# multi-line
# comment

puts 3 + 2
puts 100 - 55
puts 2 * 5
puts 4 / 2

puts 'Hello, world!'

# 1 mile = 1.4 km
puts 'Введите исходное значение(в милях):'
input_in_miles = gets.to_f
puts "#{input_in_miles} миль это #{input_in_miles * 1.4} километров"
