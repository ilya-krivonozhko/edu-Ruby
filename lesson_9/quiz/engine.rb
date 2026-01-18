# frozen_string_literal: true

require_relative 'statistics'
require_relative 'question_data'
require_relative 'file_writer'

class Engine
  def initialize
    puts 'Enter your name'
    username = gets.strip
    current_time = Time.now.strftime '%Y.%m.%d_%H:%M:%S'
    @writer = FileWriter.new username, current_time
    @writer.write "Results for user #{username}\n\n#{current_time}\n\n"
    @question_data = QuestionData.new
    @statistics = Statistics.new @writer
  end

  def run
    @question_data.collection.each do |question|
      puts question
      @writer.write question
      question.display_answers
      user_answer = question.find_answer_by ask_for_answer_char
      @writer.write "\nUser answer: #{user_answer}\n"
      check user_answer, question.correct_answer
    end
    @statistics.print_report
  end

  private

  def check(user_answer, correct_answer)
    if user_answer == correct_answer
      puts 'Correct!'
      @writer.write "Correct answer!\n"
      @statistics.correct
    else
      puts "Incorrect!\nCorrect answer: #{correct_answer}"
      @writer.write "Inorrect answer!\nCorrect answer: #{correct_answer}\n"
      @statistics.incorrect
    end
  end

  def ask_for_answer_char
    loop do
      puts "\nYour answer:"
      user_answer_char = gets.strip[0].upcase
      return user_answer_char if user_answer_char.between?('A', 'D')

      puts 'Answer can only be A - D'
    end
  end
end
