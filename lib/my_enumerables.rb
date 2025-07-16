module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |element,index|
      yield [element,index]
    end
  end

  def my_select
    selected = []
    self.each do |element|
      selected << element if yield(element)
    end
    selected
  end

  def my_all?
    self.each do |element|
      if !yield(element)
        return false
      end
    end
    true
  end

  def my_any?
    self.each do |element|
      if yield(element)
        return true
      end
    end
    false
  end

  def my_none?
    self.each do |element|
      if yield(element)
        return false
      end
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.each do |element|
        count += 1 if yield(element)
      end
      return count
    end
    self.length
  end

  def my_map
    mapped = []
    self.each do |element|
      mapped << yield(element)
    end
    mapped
  end

  def my_inject(initial=0)
    result = initial
    self.each do |element|
      result = yield(result, element)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |element|
      yield element
    end
  end
end
