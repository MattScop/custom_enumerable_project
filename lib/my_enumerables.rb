module Enumerable
  # Your code goes here
  def my_none?
    i = 0
    while i < self.length
      return false if yield(self[i])
      i += 1
    end
    true
  end

  def my_select
    i = 0
    new_array = []
    while i < self.length
      new_array.push(self[i]) if yield(self[i])
      i += 1
    end
    new_array
  end
  
  def my_map
    new_array = []
    i = 0
    while i < self.my_count
      new_array << yield(self[i])
      i += 1
    end
    new_array
  end

  def my_all?
    i = 0
    while i < self.my_count
      return false unless yield(self[i])
      i += 1
    end
    true
  end

  def my_any?
    i = 0
    while i < self.my_count
      return true if yield(self[i])
      i += 1
    end
    false
  end

  def my_count(&block)
    return self.length unless block_given?
    
    i = 0
    counter = 0
    while i < self.length
      counter += 1 if block.call(self[i])
      i += 1
    end
    counter
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end
