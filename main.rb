=begin
    
To built enumerables;

#my_each:
1-Main function is go over from each item in objects
2-Create two main section method & code-block
3-loop the parameter according to length of object
4-use the code block while the iteration to execute it
5-return the output    
=end

module Enumerable
    def my_each(obj)
        i = 0
      obj.length.times do
        yield(obj[i])
        i += 1        
        end
    end
end

include Enumerable

Enumerable.my_each([2,3,78]) {|item| 
    puts item + item
}