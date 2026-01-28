# frozen_string_literal: true

retries = 0
max_retries = 3
begin
  1 / 0 # exception
rescue ZeroDivisionError => e
  puts 'zero division!'
  puts e.inspect
  puts "Произошла ошибка класса #{e.class.name}:\n#{e.message}"
  raise NameError, 'boom!' unless retries < max_retries

  sleep 2**retries
  retries += 1
  retry # выполнить код begin ещё раз
rescue StandardError
  puts 'unknown exception!'
ensure
  puts 'ENSURE!'
end

puts 'Hi!'
