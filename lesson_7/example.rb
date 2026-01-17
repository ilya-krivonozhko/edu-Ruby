class Animal
  # Переменная класса
  @@my_class_var = 10

  def initialize(name, age)
    # instance variables (переменные образца класса)
    @name = name
    @age = age
  end

  def set_age(age)
    @age = age
  end

  def get_age
    @age
  end

  def birthday
    @age += 1
  end

  def age=(age)
    @age = age
  end
end

cat = Animal.new("Cat", 1)

cat.age = 6
cat.birthday

puts cat.get_age