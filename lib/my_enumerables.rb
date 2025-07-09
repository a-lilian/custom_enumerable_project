module Enumerable
  # Your code goes here

  def my_all?
    output = true
    self.my_each do |element|
      output = false unless yield(element)
    end
    output
  end

  def my_each_with_index
    self.size.times do |i|
      yield self[i], i
    end
    self
  end

  def my_select
    output = []

    self.my_each do |element|
      output << element if yield(element)
    end
    output
  end

  def my_any?
    output = false
    self.my_each do |element|
      output = true if yield(element)
    end
    output
  end

  def my_none?
    output = true
    self.my_each do |element|
      output = false if yield(element)
    end
    output
  end

  def my_count
    return self.size unless block_given?

    count = 0

    self.my_each do |element|
      count += 1 if yield(element)
    end

    count
  end

  def my_map
    output = []
    
    self.my_each do |element|
      output << yield(element)
    end
    output
  end

  def my_inject(initial_value)
    return initial_value if self.size.zero?

    output = initial_value
    self.my_each do |element|
      output = yield(output, element)
    end
    output
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.size.times do |i|
      yield self[i]
    end
    self
  end
end
