# frozen_string_literal: true

require 'yaml'

class FileWriter
  def initialize(username, mode = 'a')
    current_time = Time.now.strftime('%Y.%m.%d_%H:%M:%S')
    @filename = "QUIZ_#{username}_#{current_time}.txt"
    @mode = mode
    write "Results for user #{username}\n\n#{current_time}\n"
  end

  def write(text)
    File.write(@filename, text, mode: @mode)
  end
end

class Questions
  def initialize(filename)
    @filename = filename
  end

  def load
    YAML.safe_load_file(@filename, symbolize_names: true)
  end
end

puts 'Enter your name'
writer = FileWriter.new(gets.strip)

correct_answers = 0

questions = (Questions.new 'questions.yml').load
questions.shuffle.each do |question_data|
  question = "\n\nQuestion: #{question_data[:question]}"
  puts question
  writer.write question
  answers = question_data[:answers].shuffle.each_with_index.each_with_object({}) do |(answer, i), result|
    a_code = 'A'.ord
    answer_char = (a_code + i).chr
    result[answer_char] = answer
    puts "#{answer_char}. #{answer}"
    # Saving result for next iteration
  end
  loop do
    puts "\nYour answer:"
    user_answer_char = gets.strip[0].upcase
    if user_answer_char.between?('A', 'D')
      writer.write "\nUser answer: #{answers[user_answer_char]}\n"
      if answers[user_answer_char] == question_data[:correct_answer]
        correct_answers += 1
        puts 'Correct!'
        writer.write "Correct answer!\n"
      else
        puts "Incorrect!\nCorrect answer: #{question_data[:correct_answer]}"
        writer.write "Inorrect answer!\nCorrect answer: #{question_data[:correct_answer]}\n"
      end
      break
    else
      puts 'Answer can only be A - D'
    end
  end
end

incorrect_answers = questions.length - correct_answers
correct_answer_percentage = correct_answers.to_f / questions.length * 100
writer.write "\nNumber of correct answers: #{correct_answers}
Number of incorrect answers: #{incorrect_answers}
Percentage of correct answers: #{correct_answer_percentage.floor(2)}%"
