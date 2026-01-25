# frozen_string_literal: true

def method1(&block)
  method2(&block)
  # yield
  # block.call
  puts block.inspect
end

def method2(&block)
  block.call
  block.call
end

method1 do
  puts 'Hello from method'
end
