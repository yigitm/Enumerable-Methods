=begin
    
To built enumerables;

#my_each:
1-Main function is go over from each item in objects
2-Create two main section method & code-block
3-loop the parameter according to length of object
4-use the code block while the iteration to execute it
5-return the output 

#my_each_with_index:
1. The behavior is similar to the #my_each method.
2. This time the block is taking two parameters instead of one: element and number of index.
=end

module Enumerable
    def my_each(obj)
        i = 0
      obj.length.times do
        obj[i] = yield(obj[i])
        i += 1        
        end
        obj
    end

    def my_each_with_index(obj)
        i = 0
        obj.length.times do
           yield( obj[i], i)
           i += 1 
        end   
    end

    def my_select(obj)
        i = 0
        arr = Array.new
        obj.length.times do
            yield(obj[i]) == true ? arr << obj[i] : arr
            i += 1
        end
        arr    
    end

    def my_all?(obj)
        i = 0
        check = 0
        obj.length.times do
            yield(obj[i]) == false  ? check += 1 : check = check
            i += 1
        end 
        check > 0 ? false : true
    end

    def my_any?(obj)
        i = 0
        check = 0
        obj.length.times do
            yield(obj[i]) == true  ? check += 1 : check = check
            i += 1
        end 
        check > 0 ? true : false
    end

    def my_none?(obj)
        i = 0
        check = 0
        obj.length.times do
            yield(obj[i]) == true  ? check += 1 : check = check
            i += 1
        end 
        check > 0 ? false : true
    end

    def my_count(obj)
        obj_length = obj.length
        i = 0
        obj.length.times do
           yield(obj[i]) == false ? obj_length -= 1 : obj_length = obj_length
           i += 1
        end
        obj_length
    end
end



include Enumerable

# Enumerable.my_each([2, 3, 78]) {|item| 
#  puts item + item
# }

# Enumerable.my_each_with_index([2, 3, 78]) {|item ,index| 
#  puts "#{item} #{index}"
# } 

# p Enumerable.my_select([2, 3, 78, 7, 20, 43, 79]) {|item| 
#  item.even?
# }

# p Enumerable.my_all?([7, 3, 2])  { |item| item.even? }

# p Enumerable.my_any?([7, 1, 2])  { |item| item.even? }

# p Enumerable.my_none?([7, 1, 5, 9, 11])  { |item| item.even? }

p Enumerable.my_count([7, 2, 6, 9, 12]) { |item| item.even? }

