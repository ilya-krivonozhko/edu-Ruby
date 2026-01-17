# frozen_string_literal: true

require 'yaml'

all_questions_with_answers = YAML.safe_load_file('questions.yml', symbolize_names: true)

puts 'Введите ваше имя: '
user_name = gets.strip
current_time = Time.now.strftime('%Y.%m.%d_%H:%M:%S')
filename = "QUIZ_#{user_name}_#{current_time}.txt"
File.write(
  filename,
  "Результаты для пользователя #{user_name}\n\n#{current_time}\n",
  mode: 'a' # Только запись с дописыванием в конец файла
)
correct_answers_counter = 0

all_questions_with_answers.shuffle.each do |question_data|
  question = "\n\nВопрос: #{question_data[:question]}"
  puts question
  File.write(
    filename,
    question,
    mode: 'a'
  )
  answers = question_data[:answers].shuffle.each_with_index.each_with_object({}) do |(answer, i), result|
    a_code = 'A'.ord
    answer_char = (a_code + i).chr
    result[answer_char] = answer
    puts "#{answer_char}. #{answer}"
  end
  loop do
    puts "\nВаш ответ:"
    user_answer_char = gets.strip[0].upcase
    if user_answer_char.between?('A', 'D')
      File.write(
        filename,
        "\nВаш ответ: #{answers[user_answer_char]}\n",
        mode: 'a'
      )
      if answers[user_answer_char] == question_data[:correct_answer]
        correct_answers_counter += 1
        puts 'Правильно!'
        File.write(
          filename,
          "Правильный ответ!\n",
          mode: 'a'
        )
      else
        puts "Неверно!\nПравильный ответ: #{question_data[:correct_answer]}"
        File.write(
          filename,
          "Неверно!\nПравильный ответ: #{question_data[:correct_answer]}\n",
          mode: 'a'
        )
      end
      break
    else
      puts 'Ответом можгут быть только A - D'
    end
  end
end

incorrect_answers = all_questions_with_answers.length - correct_answers_counter
correct_answer_percentage = correct_answers_counter.to_f / all_questions_with_answers.length * 100
File.write(
  filename,
  "\nКоличество правильных ответов: #{correct_answers_counter}
Количество неправильных ответов: #{incorrect_answers}
Процент правильных ответов: #{correct_answer_percentage.floor(2)}%",
  mode: 'a'
)
