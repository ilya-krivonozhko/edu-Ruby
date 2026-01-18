# frozen_string_literal: true

class Statistics
  def initialize(writer)
    @correct_answers = 0
    @incorrect_answers = 0
    @writer = writer
  end

  def correct
    @correct_answers += 1
  end

  def incorrect
    @incorrect_answers += 1
  end

  def print_report
    total_answers = @correct_answers + @incorrect_answers
    correct_answer_percentage = @correct_answers.to_f / total_answers * 100
    @writer.write "\nNumber of correct answers: #{@correct_answers}\n",
                  "Number of incorrect answers: #{@incorrect_answers}\n",
                  "Percentage of correct answers: #{correct_answer_percentage.floor(2)}%"
  end
end
