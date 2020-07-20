def my_none?
    obj = self
    i = 0
    check = 0
    obj.length.times do
        yield(obj[i]) == true  ? check += 1 : check = check
        i += 1
    end 
    check > 0 ? false : true
end

public :my_none?


my_arr = [1, 5, 3]
p my_arr.my_none? { |item| item.even? } 

def my_none1?(someProc)
    obj = self
    i = 0
    check = 0
    obj.length.times do
        someProc.call(obj[i]) == true  ? check += 1 : check = check
        i += 1
    end 
    check > 0 ? false : true
end

public :my_none1?

my_arr2 = [1, 3, 5, 8]
my_proc = Proc.new { |item| item.even? }
p my_arr2.my_none1?(my_proc)