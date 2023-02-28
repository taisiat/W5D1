class Integer
  # Integer#hash already implemented for you
  # Integer.hash
end

class Array

  def hash
    answer = 0
    self.each.with_index do |ele, i|
      answer += ele.hash * i
    end
    
    answer
  end

end

class String
  def hash
    answer = 1
    self.chars.each.with_index do | char, i |
      answer += char.ord.hash * i 
    end
    answer
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    answer = 1
    self.each do | key, val |
      kv_string = "#{key}#{val}"
      answer += kv_string.ord.hash
    end
    answer
  end
end