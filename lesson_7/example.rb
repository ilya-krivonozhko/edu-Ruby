# frozen_string_literal: true

class Animal
  # Переменная класса
  @@my_class_var = 10 # rubocop:disable Style/ClassVars

  def initialize(name, age)
    # instance variables (переменные образца класса)
    @name = name
    @age = age
  end

  def set_age(age) # rubocop:disable Naming/AccessorMethodName
    @age = age
  end

  def get_age # rubocop:disable Naming/AccessorMethodName
    @age
  end

  def birthday
    @age += 1
  end

  attr_writer :age
end

cat = Animal.new('Cat', 1)

cat.age = 6
cat.birthday

puts cat.get_age
