module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    i = 0
    length.times do
      self[i] = yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    i = 0
    length.times do
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return enum_for(:my_select) unless block_given?

    i = 0
    arr = []
    length.times do
      yield(self[i]) == true ? arr << self[i] : arr
      i += 1
    end
    arr
  end

  def my_all?
    i = 0
    check = 0
    length.times do
      yield(self[i]) == false ? check += 1 : check = check
      i += 1
    end
    check.positive? ? false : true
  end

  def my_any?
    i = 0
    check = 0
    length.times do
      yield(self[i]) == true ? check += 1 : check = check
      i += 1
    end
    check.positive? ? true : false
  end

  def my_none?
    i = 0
    check = 0
    length.times do
      yield(self[i]) == true ? check += 1 : check = check
      i += 1
    end
    check.positive? ? false : true
  end

  def my_count
    return enum_for(:my_count) unless block_given?

    self_length = length
    i = 0
    length.times do
      yield(self[i]) == false ? self_length -= 1 : self_length = self_length
      i += 1
    end
    self_length
  end

  def my_map(my_proc = nil)
    arr = []
    i = 0
    if block_given?
      length.times do
        arr << yield(self[i])
        i += 1
      end
    elsif !my_proc.nil?
      length.times do
        arr << my_proc.call(self[i])
        i += 1
      end
    else
      return enum_for(:my_map)
    end
    arr
  end

  def my_inject
    i = 1
    result = self[0]
    while i < length
      result = yield(result, self[i])
      i += 1
    end
    result
  end
end

def multiply_els(obj)
    obj.inject { |x, y| x * y }
end

p multiply_els([2, 4, 5])
