# frozen_string_literal: true

class Question
  attr_reader :body, :answers, :correct_answer

  FIRST_ANSWER_CODE = 'A'.ord

  def initialize(body, raw_answers, correct_answer)
    @body = body
    @answers = number_the_answers raw_answers
    @correct_answer = correct_answer
  end

  def to_s
    "\n== #{@body} ==\n"
  end

  def find_answer_by(char)
    @answers[char]
  end

  def display_answers
    @answers.each do |char, text|
      puts "#{char}. #{text}"
    end
  end

  private

  def number_the_answers(raw_answers)
    raw_answers.each_with_index.each_with_object({}) do |(answer, i), result|
      answer_char = (FIRST_ANSWER_CODE + i).chr
      result[answer_char] = answer
    end
  end
end
