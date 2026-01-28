# Ruby Cheatsheet

A compact but thorough Ruby reference for beginners and intermediate learners. Covers core syntax, standard library, OOP, blocks, lambdas, gems, and best practices.

## [Official documentation](https://www.ruby-lang.org/en/documentation/)

## [Style Guides](https://www.ruby-lang.org/en/documentation/#style-guides)

## Table of Contents

1. [Comments](#comments)
2. [IRB (Interactive Ruby Console)](#irb-interactive-ruby-console)
3. [Basic Data Types](#basic-data-types)
4. [% Literals](#-literals)
5. [Input / Output](#input--output)
6. [Numeric Operations](#numeric-operations)
7. [Type Inspection & Conversion](#type-inspection--conversion)
8. [Boolean & Comparison Operators](#boolean--comparison-operators)
9. [Conditional Statements](#conditional-statements)
10. [Loops & Iteration](#loops--iteration)
11. [Ranges](#ranges)
12. [Methods](#methods)
13. [Blocks, Procs, Lambdas](#blocks-procs-lambdas)
14. [Passing Blocks with &](#passing-blocks-with-)
15. [Object-Oriented Programming](#object-oriented-programming)
16. [Variables & Scope](#variables--scope)
17. [Inheritance & OOP Principles](#inheritance--oop-principles)
18. [Modules & Namespaces](#modules--namespaces)
19. [Mixins](#mixins)
20. [Files](#files)
21. [JSON & YAML](#json--yaml)
22. [Date & Time](#date--time)
23. [Exception Handling](#exception-handling)
24. [Gems & Bundler](#gems--bundler)
25. [RuboCop](#rubocop)
26. [Formatting Output](#formatting-output)
27. [Summary Notes](#summary-notes)

---

## Comments

```ruby
# Single-line comment

puts 'Hello' # Inline comment after code

=begin
Multi-line comment
(not recommended in real projects,
better use #)
=end
```

---

## IRB (Interactive Ruby Console)

```bash
irb
```

Useful for experiments, quick checks, learning methods.

```ruby
2 + 2
"Ruby".downcase
```

---

## Basic Data Types

### Numbers

* Integer
* Float

```ruby
10
3.14
```

Common methods:

```ruby
10.even?
3.14.round(1)
```

### Strings

```ruby
str = "Hello"
str[0]        # => "H"
str + "!"    # Concatenation
str.downcase
str.split('')
```

⚠️ Interpolation works **only** with double quotes:

```ruby
name = "Ruby"
"Hello #{name}"  # works
'Hello #{name}'  # no interpolation
```

### Symbols

```ruby
:name
:name.object_id == :name.object_id # true
```

### Arrays

```ruby
arr = [1, "two", :three]
arr[0]
arr << 4
```

Nested arrays allowed:

```ruby
matrix = [[1, 2], [3, 4]]
```

### Hashes

```ruby
h = { a: 1, b: 2 }
h[:a]
```

### Set

```ruby
require 'set'
set = Set.new([1, 2, 2, 3])
```

---

## % Literals

```ruby
jokes = %w[1 2 3 4 5]
# same as ["1", "2", "3", "4", "5"]

%W[Hello #{name}] # with interpolation
%i[a b c]         # symbols
%I[a #{name}]     # symbols + interpolation
```

---

## Input / Output

```ruby
puts "Hello"
print "Hi"

name = gets.chomp
```

---

## Numeric Operations

```ruby
+  -  *  /  %  **
```

```ruby
2 ** 3  # => 8
5 % 2   # => 1
```

---

## Type Inspection & Conversion

```ruby
x.class
x.inspect

Integer("10")
"10".to_i
3.14.to_i
```

---

## Boolean & Comparison Operators

```ruby
true, false

>, <, >=, <=, ==, !=
```

Logical operators:

```ruby
&&  ||  !
and or not
```

---

## Conditional Statements

```ruby
if x > 0
  puts "positive"
elsif x < 0
  puts "negative"
else
  puts "zero"
end
```

### Case / Switch

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

### Ternary Operator

```ruby
x > 0 ? "yes" : "no"
```

---

## Loops & Iteration

```ruby
array.each do |el|
  puts el
end

loop do
  break
end
```

`do..end` and `{}` are equivalent, but `{}` preferred for one-liners.

---

## Ranges

```ruby
(1..5).to_a   # inclusive
(1...5).to_a # exclusive
```

---

## Methods

```ruby
def greet(name)
  "Hello #{name}"  # implicit return
end
```

Methods with `!` modify the object:

```ruby
str.upcase
str.upcase!
```

---

## Blocks, Procs, Lambdas

### Blocks

```ruby
[1,2,3].each { |n| puts n }
```

### Method with Block

```ruby
def demo(a, b)
  puts a, b
  yield if block_given?
end

demo(1, 2) { puts "Hello from block" }
```

`yield` ≈ `block.call`

Only **one block**, but many procs can be passed.

---

### Procs vs Lambdas

```ruby
p = proc { |_a| puts 'Hello from proc' }
l = ->(_a) { puts 'Hello from lambda' }
```

Two lambda syntaxes:

```ruby
lambda { |x| puts x }
->(x) { puts x }
```

Differences:

* Lambdas check arguments count
* `return` inside proc exits method

```ruby
def demo(obj)
  puts 'before'
  obj.call
  puts 'after'
end
```

---

## Passing Blocks with &

```ruby
numbers.select(&:odd?)
```

Means: pass method as a block.

---

## Object-Oriented Programming

### Classes & Instances

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
User.new("Bob")    # instance
```

### Access Control

```ruby
public
protected
private
```

---

## Variables & Scope

```ruby
local_var
@instance_var
@@class_var
$global_var
```

Constants:

```ruby
PI = 3.14
```

---

## Inheritance & OOP Principles

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

OOP Principles:

* Encapsulation
* Inheritance
* Polymorphism
* Abstraction

---

## Modules & Namespaces

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

Modules cannot be instantiated.

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

* `include` → instance methods
* `extend` → class methods

---

## Files

```ruby
File.write('test.txt', 'Hello')
File.read('test.txt')
```

---

## JSON & YAML

```ruby
require 'json'
JSON.parse('{"a":1}')
```

```ruby
require 'yaml'
YAML.load_file('file.yml')
```

---

## Date & Time

```ruby
require 'date'
Time.now
Date.today
```

---

## Exception Handling

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

## Gems & Bundler

Install gem:

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

Bundler manages dependencies.

---

## RuboCop

Static code analyzer & formatter.

```bash
gem install rubocop
rubocop
```

---

## Formatting Output

```ruby
printf("%0.2f", 3.14159)
```

---

## Summary Notes

* Last line of method is returned automatically
* Class has class methods and instance methods
* One block per method call
* Ruby is dynamic, expressive, and OOP-centric


