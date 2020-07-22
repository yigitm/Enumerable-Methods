module Enumerable
   def my_all?(parameter = nil)
    i = 0
    check = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    while block_given? && i < new_self.length
      yield(new_self[i]) == true ? check += 1 : check = check
      i += 1
    end
    
    #This is for first issue : my_all? when no block or argument is given returns true when none of the collection members is false or nil
    if parameter == nil && block_given? == false
    return true

    #This is for second issue : my_all? when a class is passed as an argument returns true if all of the collection is a member of such class::Numeric
    elsif parameter.class != nil && block_given? == false
       result = []
       loop do
          result << self[i].class
         i += 1
         break if i == self.length
       end
     
     i = 0
     loop do
     if result[i] == parameter
     check = check += 1
     elsif result[i].superclass == parameter
     check = check += 1
     end
     i += 1
     break if i == self.length
     end 
     check == result.length ? true : false
    
    end  

    if parameter.instance_of?(Regexp)
      new_self.length.times do
        new_self[i] =~ parameter ? check += 1 : check = check
        i += 1
      end

    elsif
      new_self.length.times do
        new_self[i].class == parameter ? check += 1 : check = check
        i += 1
      end
    
    end
    check == new_self.length
  end

end

p [1,2,3].my_all?