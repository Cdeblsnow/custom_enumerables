module Enumerable

  def my_each_with_index
    i = 0

    self.each do |array|
      yield(array, i) if block_given?
      i += 1  
    end
    return self
  end

  def my_select
    hold = []
    i = 0
    
    self.each do |element|
      hold << element if yield(element)
      i += 1
    end
    
    return hold if i == self.length  
  end

  def my_all?
    hold = []
    i = 0
    
    self.each do |element|
      hold << element if yield(element)
      i += 1
    end

    if hold.length == self.length
      return true 
    else 
      return false 
    end
  end

  def my_any?
    i = 1
    self.each do |element|
        if yield(element) == true
          return true
        elsif i >= self.length
          return false 
        end
      i += 1  
      end
  end

  def my_none?
    self.each do |element|
        if yield(element) == false
          return true
        elsif yield(element) == true
          return false 
        end 
      end
  end

  def my_count
    length = 0
    count = 0

    self.each do |element|
      if block_given? 
        count += 1 if yield(element) == true
      else 
        return self.length
      end 

      length += 1
      return count if length >= self.length  
    end
  end

  def my_map 
    hold = []

    self.each do |element|
      hold << yield(element) if block_given?
    end
    return hold
  end

  def my_inject(args)
    hold = args
    
    self.each do |element|
       hold = yield(hold, element)
    end
    return hold
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    hold = []

    self.each do |array|
      hold << array if yield(array)
    end
    return self #after not finding anything and iterating all the array
  end
end


