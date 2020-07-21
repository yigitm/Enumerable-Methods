module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?
    
    self_class = self.class
    new_self = self

    if self_class == Array
      new_self = self
    elsif self_class == Range
     new_self = self.to_a
    elsif self_class == Hash
     new_self_h = self
    end
    i = 0
      new_self.length.times do
      yield(new_self[i])
      i += 1
    end
    new_self
  end

end

grades = { "Jane Doe" => 10, "Jim Doe" => 6 }

p grades.my_each { |k, v|  puts "key: #{k} + value: #{v}"   }

# p { "Jane Doe" => 10, "Jim Doe" => 6 }.my_each { |x|  x * x += 1  }
# def multiply_els(obj)
#   obj.inject { |x, y| x * y }
# end

# p multiply_els([2, 4, 5])
