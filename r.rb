module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?
    
    self_class = self.class
    new_self = self
    i = 0

    self_class == Array || self_class == Hash ? new_self = self.flatten : new_self = self.to_a
    if self_class == Array || self_class == Range
      new_self.length.times do
        yield(new_self[i])
        i += 1
      end
    elsif self_class == Hash
      new_self.length/2.times do
        yield(new_self[i], new_self[i+1])
        i += 2
      end
    else 
      new_self
    end
    new_self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    self_class = self.class
    new_self = self
    i = 0
    self_class == Array || self_class == Hash ? new_self = self.flatten : new_self = self.to_a   
      new_self.length.times do
            yield(new_self[i], i)
            i += 1
          end
    new_self
  end



  def my_select
    return enum_for(:my_select) unless block_given?

    i = 0
    arr = Array.new
    self_class = self.class
    new_self = self
    self_class == Array || self_class == Hash ? new_self = self.flatten : new_self = self.to_a
    new_self.length.times do
      yield(new_self[i]) == true ? arr = arr.push(new_self[i])  : arr
      i += 1
    end
     arr
  end
end

grades = { "Jane Doe" => 10, "Jim Doe" => 6 }
#p [1,2,3].my_each_with_index { |x, y|  puts "Element: #{x} => Index: #{y}"}

p grades.my_select{|x| x.is_a? Integer }

# p { "Jane Doe" => 10, "Jim Doe" => 6 }.my_each { |x|  x * x += 1  }
# def multiply_els(obj)
#   obj.inject { |x, y| x * y }
# end

# p multiply_els([2, 4, 5])
