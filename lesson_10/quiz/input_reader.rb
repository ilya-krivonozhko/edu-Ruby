# frozen_string_literal: true

class InputReader
  def read(welcome_msg: nil, validator: nil, error_msq: nil, process: nil)
    puts welcome_msg if welcome_msg
    value = gets.strip
    value.process.call(value) if process
    return value if validator.nil?
    return value if validator.call(value)

    read(welcome_msg: welcome_msg, validator: validator, error_msq: error_msq)
  end
end
