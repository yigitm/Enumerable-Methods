def my_practice(parameter)
    check = 0
    i = 0
    if parameter == Regexp
      self.length.times do 
        self[i] =~ parameter ? check += 1 : check = check
        i += 1
      end
    else 
      self.length.times do
        self[i].class == parameter ? check += 1 : check = check
        i += 1
      end
    end
    check == self.length ? true : false
end


def my_count
  return enum_for(:my_count) unless block_given?

  self_length = length
  i = 0
  new_self = self
  new_self.instance_of?(Array) || new_self.instance_of?(Hash) ? new_self = self.flatten : new_self = self.to_a
  length.times do
    yield(new_self[i]) == false ? self_length -= 1 : self_length = self_length
    i += 1
  end
  self_length
end

public :my_count
my_hash = {78 => 19, 34 => 35}
p my_hash.my_count