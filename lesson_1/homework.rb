# frozen_string_literal: true

# 1 mile = 1.4 km
puts 'Введите исходное значение(в километрах):'
input_in_kilometers = gets.to_f
puts "#{input_in_kilometers} километров это #{input_in_kilometers / 1.4} миль"
