# Шпаргалка по Ruby

Компактный, но полный справочник по Ruby для начинающих и продолжающих. Синтаксис, стандартная библиотека, ООП, блоки, лямбды, gems и best practices.

## [Официальная документация](https://www.ruby-lang.org/ru/documentation/)

## [Соглашения по стилю кода](https://www.ruby-lang.org/ru/documentation/#%D1%81%D1%82%D0%B8%D0%BB%D1%8C-%D0%BA%D0%BE%D0%B4%D0%B0)

## Содержание

1. [Комментарии](#комментарии)
2. [IRB (интерактивная консоль Ruby)](#irb-интерактивная-консоль-ruby)
3. [Основные типы данных](#основные-типы-данных)
4. [% literals](#-literals)
5. [Ввод / вывод в консоль](#ввод--вывод-в-консоль)
6. [Операции с числами](#операции-с-числами)
7. [Определение типа и inspect](#определение-типа-и-inspect)
8. [Boolean и операции сравнения](#boolean-и-операции-сравнения)
9. [Условные операторы](#условные-операторы)
10. [Циклы и итерация](#циклы-и-итерация)
11. [Диапазоны (Range)](#диапазоны-range)
12. [Методы](#методы)
13. [Blocks, Procs, Lambdas](#blocks-procs-lambdas)
14. [Передача метода как block (&)](#передача-метода-как-block-)
15. [ООП в Ruby](#ооп-в-ruby)
16. [Уровни доступа](#уровни-доступа)
17. [Переменные и область видимости](#переменные-и-область-видимости)
18. [Наследование и принципы ООП](#наследование-и-принципы-ооп)
19. [Modules и namespace](#modules-и-namespace)
20. [Mixins](#mixins)
21. [Работа с файлами](#работа-с-файлами)
22. [JSON и YAML](#json-и-yaml)
23. [Дата и время](#дата-и-время)
24. [Обработка исключений](#обработка-исключений)
25. [Gems и Bundler](#gems-и-bundler)
26. [RuboCop](#rubocop)
27. [Форматный вывод](#форматный-вывод)
28. [Важные заметки](#важные-заметки)

---

## Комментарии

```ruby
# Однострочный комментарий

puts 'Hello' # Комментарий после строки с кодом

=begin
Многострочный комментарий
(на практике почти не используется,
предпочтительнее #)
=end
```

---

## IRB (интерактивная консоль Ruby)

```bash
irb
```

Используется для экспериментов, изучения методов и быстрой проверки кода.

```ruby
2 + 2
"Ruby".downcase
```

---

## Основные типы данных

### Числа (Numbers)

* Integer
* Float

```ruby
10
3.14
```

Популярные методы:

```ruby
10.even?
3.14.round(1)
```

---

### Строки (String)

```ruby
str = "Hello"
str[0]        # => "H"
str + "!"    # Конкатенация
str.downcase
str.split('')
```

⚠️ Интерполяция работает **только** в строках с двойными кавычками:

```ruby
name = "Ruby"
"Hello #{name}"  # работает
'Hello #{name}'  # не работает
```

---

### Symbols

```ruby
:name
:name.object_id == :name.object_id # true
```

---

### Массивы (Array)

```ruby
arr = [1, "two", :three]
arr[0]
arr << 4
```

* Массив может содержать элементы разных типов
* Поддерживаются вложенные массивы

```ruby
matrix = [[1, 2], [3, 4]]
```

---

### Hash

```ruby
h = { a: 1, b: 2 }
h[:a]
```

---

### Set

```ruby
require 'set'
set = Set.new([1, 2, 2, 3])
```

---

## % literals

```ruby
jokes = %w[1 2 3 4 5]
# то же самое, что ["1", "2", "3", "4", "5"]

%W[Hello #{name}] # строки с интерполяцией
%i[a b c]         # symbols
%I[a #{name}]     # symbols с интерполяцией
```

---

## Ввод / вывод в консоль

```ruby
puts "Hello"
print "Hi"

name = gets.chomp
```

---

## Операции с числами

```ruby
+  -  *  /  %  **
```

```ruby
2 ** 3  # => 8
5 % 2   # => 1
```

---

## Определение типа и inspect

```ruby
x.class
x.inspect
```

Приведение типов:

```ruby
"10".to_i
3.14.to_i
Integer("10")
```

---

## Boolean и операции сравнения

```ruby
true, false

>, <, >=, <=, ==, !=
```

Логические операции:

```ruby
&&  ||  !
and or not
```

---

## Условные операторы

### if / elsif / else

```ruby
if x > 0
  puts "positive"
elsif x < 0
  puts "negative"
else
  puts "zero"
end
```

### case (switch)

```ruby
case value
when 1
  puts "one"
when 2
  puts "two"
else
  puts "other"
end
```

### Тернарный оператор

```ruby
x > 0 ? "yes" : "no"
```

---

## Циклы и итерация

```ruby
array.each do |el|
  puts el
end

loop do
  break
end
```

`do..end` и `{}` эквивалентны, но `{}` принято использовать для однострочных блоков.

---

## Диапазоны (Range)

```ruby
(1..5).to_a   # включительно
(1...5).to_a # не включая последний
```

---

## Методы

```ruby
def greet(name)
  "Hello #{name}"  # return писать не обязательно
end
```

Методы с `!` изменяют объект:

```ruby
str.upcase
str.upcase!
```

---

## Blocks, Procs, Lambdas

### Block

```ruby
[1,2,3].each { |n| puts n }
```

### Метод, принимающий block

```ruby
def demo(a, b)
  puts a, b
  yield if block_given?
end

demo(1, 2) do
  puts "Hello from block"
end
```

`yield` ≈ `block.call`

* В метод можно передать только **один block**
* Но можно передать несколько proc

---

### Proc vs Lambda

```ruby
p = proc { |_arg| puts 'Hello from proc' }
l = ->(_arg) { puts 'Hello from lambda' }
```

Две формы записи lambda:

```ruby
lambda { |x| puts x }
->(x) { puts x }
```

Отличия:

* lambda проверяет количество аргументов
* return внутри proc завершает метод

```ruby
def demo(obj)
  puts 'before obj call'
  obj.call
  puts 'after obj call'
end
```

---

## Передача метода как block (&)

```ruby
numbers.select(&:odd?)
```

Эквивалентно блоку `{ |n| n.odd? }`.

---

## ООП в Ruby

### Классы и instance методы

```ruby
class User
  def initialize(name)
    @name = name
  end

  def greet
    "Hi #{@name}"
  end

  def self.type
    "Human"
  end
end
```

```ruby
User.type          # class method
User.new("Bob")    # instance method
```

---

## Уровни доступа

```ruby
public
protected
private
```

---

## Переменные и область видимости

```ruby
local_var      # живёт внутри метода
@instance_var  # живёт внутри объекта
@@class_var    # живёт внутри класса
$global_var    # доступна везде
```

Константы:

```ruby
PI = 3.14
```

---

## Наследование и принципы ООП

```ruby
class Animal
  def speak; end
end

class Dog < Animal
  def speak
    "Woof"
  end
end
```

Принципы ООП:

* Encapsulation
* Inheritance
* Polymorphism
* Abstraction

---

## Modules и namespace

```ruby
module Printer
  class Engine; end
end

module Importer
  class Engine; end
end
```

```ruby
Printer::Engine.new
Importer::Engine.new
```

* Класс можно инстанцировать
* Модуль нельзя

---

## Mixins

```ruby
module Flyable
  def fly; end
end

class Bird
  include Flyable
end
```

* `include` — instance методы
* `extend` — class методы

---

## Работа с файлами

```ruby
File.write('test.txt', 'Hello')
File.read('test.txt')
```

---

## JSON и YAML

```ruby
require 'json'
JSON.parse('{"a":1}')
```

```ruby
require 'yaml'
YAML.load_file('file.yml')
```

---

## Дата и время

```ruby
require 'date'
Time.now
Date.today
```

---

## Обработка исключений

```ruby
begin
  risky
rescue StandardError => e
  puts e.message
ensure
  puts 'done'
end
```

---

## Gems и Bundler

Установка gem:

```bash
gem install pry
```

Gemfile:

```ruby
gem 'rails'
```

```bash
bundle install
```

Bundler управляет зависимостями проекта.

---

## RuboCop

Статический анализатор и форматтер кода.

```bash
gem install rubocop
rubocop
```

---

## Форматный вывод

```ruby
printf("%0.2f", 3.14159)
```

---

## Важные заметки

* Последняя строка метода — возвращаемое значение
* Вызов метода может принимать только один block
* Ruby — динамический, ООП-ориентированный язык
