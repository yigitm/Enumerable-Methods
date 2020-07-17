def my_none?(someProc)
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
my_arr.my_none? { |item| item.even? }

my_proc = Proc.new { |item| item.even? }
my_arr.my_none?(my_proc) 

