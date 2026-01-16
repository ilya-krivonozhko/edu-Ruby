# frozen_string_literal: true

require 'faraday'
require 'json'

token = 'YOUR TOKEN'
url = 'https://api.twitter.com/2/users/1340584098075717635/tweets'

responce = Faraday.get(
  url,
  { max_results: 12 },
  { 'Authorization' => "Bearer #{token}" }
)

raw_tweets = JSON.parse(responce.body) # string to hash
tweets = raw_tweets['data'].map do |tweet|
  match = tweet['text'].match(/\n([А-Яа-яёЁ]+):\s*(.+)/)
  zodiac = match[1]
  prediction = match[2]
  { zodiac.downcase => prediction }
end
# Превращаем массив хэшей в большой хэш
tweets = tweets.reduce({}, :merge)

puts 'Введите свой знак зодиака:'
user_zodiac_sign = gets.strip.downcase
user_horoscope = tweets[user_zodiac_sign]
if user_horoscope.nil?
  puts 'К сожалению, для вас нет гороскопа.'
else
  puts "Ваш гороскоп:\n#{user_horoscope}"
end
