require 'pry-byebug'

module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    for element in self do
      yield(element, count)
      count += 1
    end
  end

  def my_select
    selected = []
    for element in self do
      selected << element if yield(element)
    end
    selected
  end

  def my_all?
    matches = 0
    for element in self do
      matches += 1 if yield(element)
    end
    matches == self.size
  end

  def my_any?
    matches = 0
    for element in self do
      matches += 1 if yield(element)
    end
    matches.positive?
  end

  def my_none?
    matches = 0
    for element in self do
      matches += 1 if yield(element)
    end
    matches.zero?
  end

  def my_count
    if block_given?
      matches = 0
      for element in self do
        matches += 1 if yield(element)
      end
      matches
    else
      self.size
    end
  end
  
  def my_map
    mapped = []
    for element in self do
      mapped << yield(element)
    end
    mapped
  end

  def my_inject(initial_operand = nil)
    memo = initial_operand
    if initial_operand
    else
      memo = 0
    end

    for operand in self do
      memo = yield(memo, operand)
    end
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield(element)
    end
  end
end
