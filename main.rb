module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    new_self = self
    i = 0
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if self_class == Array || self_class == Range
      new_self.length.times do
        yield(new_self[i])
        i += 1
      end
    elsif self_class == Hash
      new_self.length / 2.times do
        yield(new_self[i], new_self[i + 1])
        i += 2
      end
    else
      new_self
    end
    new_self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    new_self = self
    i = 0
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    new_self.length.times do
      yield(new_self[i], i)
      i += 1
    end
    new_self
  end

  def my_select
    return enum_for(:my_select) unless block_given?

    i = 0
    arr = []
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    new_self.length.times do
      yield(new_self[i]) == true ? arr = arr.push(new_self[i]) : arr
      i += 1
    end
    arr
  end

  def my_all?(parameter = nil)
    i = 0
    check = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    while block_given? && i < new_self.length
      yield(new_self[i]) == true ? check += 1 : check = check
      i += 1
    end
    if parameter.instance_of?(Regexp)
      new_self.length.times do
        new_self[i] =~ parameter ? check += 1 : check = check
        i += 1
      end
    else
      new_self.length.times do
        new_self[i].class == parameter ? check += 1 : check = check
        i += 1
      end
      end
    check == new_self.length
  end

  def my_any?(parameter = nil)
    i = 0
    check = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    while block_given? && i < new_self.length
      yield(new_self[i]) == true ? check += 1 : check = check
      i += 1
    end
    if parameter.instance_of?(Regexp)
      new_self.length.times do
        new_self[i] =~ parameter ? check += 1 : check = check
        i += 1
      end
    else
      new_self.length.times do
        new_self[i].class == parameter ? check += 1 : check = check
        i += 1
      end
    end
    check.positive? ? true : false
  end

  def my_none?(parameter = nil)
    i = 0
    check = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    while block_given? && i < new_self.length
      yield(new_self[i]) == true ? check += 1 : check = check
      i += 1
    end
    if parameter.instance_of?(Regexp)
      new_self.length.times do
        new_self[i] =~ parameter ? check += 1 : check = check
        i += 1
      end
    else
      new_self.length.times do
        new_self[i].class == parameter ? check += 1 : check = check
        i += 1
      end
    end
    check.positive? ? false : true
  end

  def my_count
    return enum_for(:my_count) unless block_given?

    self_length = length
    i = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    length.times do
      yield(new_self[i]) == false ? self_length -= 1 : self_length = self_length
      i += 1
    end
    self_length
  end

  def my_map(my_proc = nil)
    arr = []
    i = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if block_given?
      new_self.length.times do
        arr = arr << yield(new_self[i])
        i += 1
      end
    elsif !my_proc.nil?
      new_self.length.times do
        arr = arr << my_proc.call(new_self[i])
        i += 1
      end
    else
      return enum_for(:my_map)
    end
    arr
  end

  def my_inject(sym = nil)
    i = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    result = new_self[0]
    if block_given?
      while i < length - 1
        result = yield(result, new_self[i + 1].to_i)
        p result
        i += 1
      end
    elsif !sym.nil?
      sym = sym.to_s
      while i < new_self.length - 1
        self_elem = new_self[i + 1]
        result = result.send(sym, self_elem.to_i)
        i += 1
      end
    end
    result
  end
end

def multiply_els(obj)
  obj.my_inject(:*)
end
