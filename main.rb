# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

module Enumerable
  def my_each(&block)
    return enum_for(:my_each_with_index) unless block_given?

    new_self = self
    i = 0
    a = 0
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if instance_of?(Hash)
        while i < new_self.length/2
            block.arity == 1 ? yield(new_self.slice(a,2)) : yield(new_self[a], new_self[a + 1])
            i += 1
            a += 2
          end
    elsif 
        new_self.length.times do
            yield(new_self[i])
            i += 1
          end
    end
    self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    arr = []
    new_self = self
    i = 0
    a = 0
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if instance_of?(Hash)
      while i < new_self.length/2
        yield(new_self.slice(a,2), i)
        i += 1
        a += 2
      end
    elsif 
        new_self.length.times do
          yield(new_self[i], i)
          i += 1
        end
    end
    self
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
    if !block_given? && parameter == nil
      if instance_of?(Hash)
        check = new_self.length
      else 
        new_self.length.times do
        new_self[i] != nil && new_self[i] != false ? check += 1 : check = check
        i += 1
        end
      end
    elsif block_given? && parameter == nil
      new_self.length.times do
        yield(new_self[i]) == true ? check += 1 : check = check
        i += 1
      end
    elsif parameter != nil
      if parameter.instance_of?(Regexp)
        new_self.length.times do
          new_self[i] =~ parameter ? check += 1 : check = check
          i += 1
        end
      elsif parameter.instance_of?(Class) 
        new_self.length.times do
          new_self[i].is_a?(parameter) ? check += 1 : check = check
          i += 1
        end
      else 
        new_self.length.times do
          new_self[i] == parameter ? check += 1 : check = check
          i += 1
        end
      end
    end
    check == new_self.length
  end

  def my_any?(parameter = nil)
    i = 0
    check = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if !block_given? && parameter == nil
      if instance_of?(Hash)
        check = 1
      else
        new_self.length.times do
        new_self[i] != nil && new_self[i] != false ? check += 1 : check = check
        i += 1
        end
      end
    elsif block_given? && parameter == nil
      new_self.length.times do
        yield(new_self[i]) == true ? check += 1 : check = check
        i += 1
      end
    elsif parameter != nil
      if parameter.instance_of?(Regexp)
        new_self.length.times do
          new_self[i] =~ parameter ? check += 1 : check = check
          i += 1
        end
      elsif parameter.instance_of?(Class) 
        new_self.length.times do
          new_self[i].is_a?(parameter) ? check += 1 : check = check
          i += 1
        end
      else 
        new_self.length.times do
          new_self[i] == parameter ? check += 1 : check = check
          i += 1
        end
      end
    end
    check.positive? ? true : false
  end

  def my_none?(parameter = nil)
    i = 0
    check = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if !block_given? && parameter == nil
      if instance_of?(Hash)
        check = 1
      else
        new_self.length.times do
        new_self[i] != nil && new_self[i] != false ? check += 1 : check = check
        i += 1
        end
      end
    elsif block_given? && parameter == nil
      new_self.length.times do
        yield(new_self[i]) == true ? check += 1 : check = check
        i += 1
      end
    elsif parameter != nil
      if parameter.instance_of?(Regexp)
        new_self.length.times do
          new_self[i] =~ parameter ? check += 1 : check = check
          i += 1
        end
      elsif parameter.instance_of?(Class) 
        new_self.length.times do
          new_self[i].is_a?(parameter) ? check += 1 : check = check
          i += 1
        end
      else 
        new_self.length.times do
          new_self[i] == parameter ? check += 1 : check = check
          i += 1
        end
      end
    end
    check.positive? ? false : true
  end


  def my_count(parameter = nil)
    i = 0
    a = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    self_length = new_self.length
    if block_given? && parameter == nil
      if instance_of?(Hash)
        while i < new_self.length/2
          new_self[i] = new_self.slice(a,2)
          new_self[i] == parameter ? self_length = self_length : self_length -= 2
          i += 1
          a += 2
        end
      else
        new_self.length.times do
          yield(new_self[i]) == false ? self_length -= 1 : self_length = self_length
          i += 1
        end
      end
    elsif !block_given? && parameter != nil
      if instance_of?(Hash)
        while i < new_self.length/2
          new_self[i] = new_self.slice(a,2)
          new_self[i] == parameter ? self_length = self_length : self_length -= 2
          i += 1
          a += 2
        end
      else
        new_self.length.times do
          new_self[i] == parameter ? self_length = self_length : self_length -= 1
          i += 1
        end
      end
    else 
      if instance_of?(Hash)
        self_length = self_length/2
      else
        self_length = self_length
      end
    end
    self_length
  end

  def my_map(my_proc = nil)
    arr = []
    i = 0
    a = 0
    new_self = self
    new_self = new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? flatten : to_a
    if !my_proc.nil? || !my_proc.nil? && block_given?
      if instance_of?(Hash)
        while i < new_self.length/2
          arr = arr << yield(new_self.slice(a,2))
          i += 1
          a += 2
        end 
      else
        new_self.length.times do
          arr = arr << my_proc.call(new_self[i])
          i += 1
        end
      end
    elsif block_given?
      if instance_of?(Hash)
        while i < new_self.length/2
          arr = arr << yield(new_self.slice(a,2))
          i += 1
          a += 2
        end 
      else
        new_self.length.times do
          arr = arr << yield(new_self[i])
          i += 1
        end
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

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
my_proc = Proc.new {|x| x > 10}
grades = {"a" => 10, "b" => 3}
p grades.map {|x| puts "#{x}" }