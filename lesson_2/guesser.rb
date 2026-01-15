# frozen_string_literal: true

puts 'Я загадал число от 1 до 10. Попробуй угадать: '
random_number = (rand * 10).to_i + 1
loop do
  guess = gets.to_i
  if guess == random_number
    puts 'Молодец!'
    break
  elsif guess < random_number
    puts 'Нет, моё число больше'
  else
    puts 'Нет, моё число меньше'
  end
end
