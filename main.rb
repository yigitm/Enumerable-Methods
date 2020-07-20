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
include Enumerable
module Enumerable
    def my_each
      return enum_for(:my_each) unless block_given?
      i = 0
      self.length.times do
        self[i] = yield(self[i])
        i += 1        
        end
        self
    end

    def my_each_with_index
        return enum_for(:my_each_with_index) unless block_given?
        i = 0
        self.length.times do
           yield( self[i], i )
           i += 1
        end 
    end

    def my_select
        return enum_for(:my_select) unless block_given?
        i = 0
        arr = Array.new
        self.length.times do
            yield(self[i]) == true ? arr << self[i] : arr
            i += 1
        end
        arr
    end

    def my_all?
        return enum_for(:my_select) unless block_given?
        i = 0
        check = 0
        self.length.times do
            yield(self[i]) == false  ? check += 1 : check = check
            i += 1
        end 
        check > 0 ? false : true
    end

    def my_any?
        return enum_for(:my_select) unless block_given?
        i = 0
        check = 0
        self.length.times do
            yield(self[i]) == true  ? check += 1 : check = check
            i += 1
        end 
        check > 0 ? true : false
    end

    def my_none?
        return enum_for(:my_select) unless block_given?
        i = 0
        check = 0
        self.length.times do
            yield(self[i]) == true  ? check += 1 : check = check
            i += 1
        end 
        check > 0 ? false : true
    end

    def my_count
        return enum_for(:my_select) unless block_given?
        self_length = self.length
        i = 0
        self.length.times do
           yield(self[i]) == false ? self_length -= 1 : self_length = self_length
           i += 1
        end
        self_length
    end

    def my_map
        return enum_for(:my_select) unless block_given?
        arr = Array.new()
        i = 0
        self.length.times do
            arr << yield(self[i])
            i += 1        
        end
      arr  
    end

end

#  p arr.my_each_with_index {|item ,index| puts "#{index} #{item}" }

# p [1, 4, 6, 7].my_each {|item| 
#  item + item
#  }
#  puts "#{item} #{index}"
# } 

arr = [2, 3, 78, 7, 20, 43, 79]
p arr.my_count {|item| item.even?}

# p Enumerable.my_all?([7, 3, 2])  { |item| item.even? }

# p Enumerable.my_any?([7, 1, 2])  { |item| item.even? }

# p Enumerable.my_none?([7, 1, 5, 9, 11])  { |item| item.even? }

# p Enumerable.my_count([7, 2, 6, 9, 12]) { |item| item.even? }

#p Enumerable.my_map([1, 2, 3,]) { |item| item * item }