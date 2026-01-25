# frozen_string_literal: true

p = proc do |a, b|
  result = a + b
  puts "hello from proc! #{result}"
  result
end

p2 = proc { |str| puts str.upcase }

def caller(my_proc, my_proc2)
  my_proc.call(10, 20)
  my_proc2.call('str')
end

caller(p, p2)

final_result = p.call(10, 20)
puts final_result
puts p2.call('my_str')
