# frozen_string_literal: true

class Animal
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    puts 'Животное что-то сказало'
  end
end

class Dog < Animal
  # переопределённый метод
  def speak
    puts 'Гав!'
  end

  def eat(amount)
    if amount > 0.5
      puts 'Я не могу съесть так много'
    else
      puts 'Спасибо, очень вкусно!'
    end
  end
end

class SmallDog < Dog
end

class Cat < Animal
  # переопределённый метод
  def speak
    puts 'Мяу!'
  end

  def eat(amount)
    if amount > 0.3
      puts 'Я не могу съесть так много'
    else
      puts 'Спасибо, очень вкусно!'
    end
  end
end
