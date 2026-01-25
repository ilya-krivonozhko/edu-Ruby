# frozen_string_literal: true

[1, 2, 3].each do |el|
  puts el
end

new_arr = [1, 2, 3].map do |el|
  el * 2
end

puts new_arr
puts '_______________'
def demo(arg1, arg2)
  puts arg1, arg2
  return unless block_given?

  yield # Выполнить тот блок, который был передан в метод
end

demo(100, 50) do
  puts 'Hello from block!'
end

puts '_______________'

def demo1(arg1, _arg2)
  return unless block_given?

  yield(arg1) # Выполнить тот блок, который был передан в метод
end

demo1(100, 50) do |el|
  puts el
end

puts '_______________'

def demo2(*args, &block)
  return unless block_given?

  args.each(&block)
end

demo2(100, 50) do |el|
  puts el * 2
end

puts '_______________'

def demo3(*args)
  return unless block_given?

  args.each do |arg|
    puts yield arg # Выполнить тот блок, который был передан в метод
  end
end

demo3(101, 50, 2, 3, 5, 6, 7, &:odd?)
