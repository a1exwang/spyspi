require 'digest/sha1'

class HashBucket
  def initialize
    @data = {}
  end

  def add(obj)
    h = hash_func(obj)
    @data[h.to_sym] = [] unless @data[h.to_sym]
    @data[h.to_sym].push obj
  end
  def remove(obj)
    h = hash_func(obj)
    false unless @data[h.to_sym]
    @data[h.to_sym].delete obj
  end

  def size
    ret = 0
    @data.keys.each do |key|
      @data[key].each do |obj|
        ret += 1
      end
    end
  end
  def approximate_size
    @data.size
  end

  def exist?(obj)
    h = hash_func(obj)
    return false unless @data[h.to_sym]
    @data[h.to_sym].each do |d|
      return true if d == obj
    end
    false
  end

  def hash_func(obj)
    Digest::SHA1.hexdigest(obj.to_s)
  end
end