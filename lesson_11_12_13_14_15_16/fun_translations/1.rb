# frozen_string_literal: true

require 'fun_translations'

begin
  client = FunTranslations.client('Example API token')
rescue FunTranslations::Error::TooManyRequests
  puts 'Too many requests!'
end

result = client.translate :pirate, 'Hello, sir!'
puts result.translated_text
