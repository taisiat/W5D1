class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      self.resize! if @count + 1 >= self.num_buckets
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    flattened = @store.flatten
    @store = Array.new(2 * num_buckets) { Array.new }
    @count = 0
    flattened.each do | ele |
      self.insert(ele)
    end
  end

  def [](key)
    h_key = key.hash
    @store[h_key % self.num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end
end