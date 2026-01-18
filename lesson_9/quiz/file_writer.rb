# frozen_string_literal: true

class FileWriter
  def initialize(username, current_time, mode = 'a')
    @filename = "QUIZ_#{username}_#{current_time}.txt"
    @mode = mode
  end

  def write(*args)
    args.each do |text|
      File.write(@filename, text, mode: @mode)
    end
  end
end
