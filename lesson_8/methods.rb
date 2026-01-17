# frozen_string_literal: true

class Cat
  attr_reader :age

  # Instance method (метод образца класса)
  def initialize(age)
    @age = to_cat_years(age)
  end

  # Class method
  def self.speak
    puts 'Meow!'
  end

  def to_cat_years(human_age)
    human_age.to_f / 4
  end
end

my_cat = Cat.new 40

puts "My cat is #{my_cat.age} years old"

puts "40 human years old is #{my_cat.to_cat_years(40)} years old"
