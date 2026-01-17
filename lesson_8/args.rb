# frozen_string_literal: true

class Sample
  def my_method(arg1, arg2, arg3 = :test, arg4 = 100)
    puts arg1, arg2, arg3, arg4
  end

  def new_way(arg1:, arg2:, arg3: :test, arg4: 100)
    puts arg1, arg2, arg3, arg4
  end

  # poetry mode
  # Если последний аргумент функции - хэш, можно опустить скобки
  # Если хэша два, так можно сделать только на последнем
  def poetry(num, hash)
    puts num, hash
  end
end

s = Sample.new

s.new_way arg2: 'arg2', arg1: 'arg1'

s.poetry(1, key1: 'value', key2: 'value2')
