# frozen_string_literal: true

p = proc { |_arg1| puts 'Hello from proc' }
p.call('test', 1, 2)

# l = ->(_arg1) { puts 'Hello from lambda' }
# l.call('test', 1, 2)

def demo(obj)
  puts 'before obj call'
  obj.call # т.к. внутри процедуры return, последующий код не выполнится
  puts 'after obj call'
end

l = lambda do
  puts 'I`m inside lambda!'
  42
end

# result = demo(p)
# puts result

result2 = demo(l)
puts result2
