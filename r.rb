def my_inject(sym=nil)
  i = 0
  new_self = self
  new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? new_self = self.flatten : new_self = self.to_a
  result = new_self[0]
  if block_given?
    while i < length-1
      result = yield(result, new_self[i+1].to_i)
      p result
      i += 1
    end
  elsif sym != nil 
    sym = sym.to_s
    while i < new_self.length-1
      self_elem = new_self[i+1]
      result = result.send(sym, self_elem.to_i)
      i += 1
    end
  end
  result
end

public :my_inject
p (1..4).my_inject(:+)

# p { "Jane Doe" => 10, "Jim Doe" => 6 }.my_each { |x|  x * x += 1  }
# def multiply_els(obj)
#   obj.inject { |x, y| x * y }
# end

# p multiply_els([2, 4, 5])
