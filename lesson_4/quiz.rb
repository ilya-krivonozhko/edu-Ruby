# frozen_string_literal: true

data = {
  'РФ' => 'Москва',
  'Китай' => 'Пекин',
  'Франция' => 'Париж',
  'Великобритания' => 'Лондон',
  'Норвегия' => 'Осло',
  'Камбоджа' => 'Пномпень'
}

# countries.each.with_index do |country, index|
data.each do |country, capital|
  puts "Страна #{country}"
  user_input = gets.strip.downcase
  # if user_input == capitals[index]
  if user_input == capital.downcase
    puts 'Молодец!'
  else
    puts 'Ошибка'
    puts "Правильный ответ #{capital}"
  end
end
