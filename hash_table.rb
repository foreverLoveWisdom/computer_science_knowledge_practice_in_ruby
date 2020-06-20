class HashTable
  attr_accessor :data

  def initialize(size)
    @data = Array.new(size)
  end

  def set(key, value)
    address = get_hash(key)

    unless data[address]
      data[address] = []
    end
    data[address].push([key, value])
  end

  def get(key)
    address = get_hash(key)
    data[address]&.each do |pairs|
      return pairs.last if pairs.first == key
    end
  end

  def keys
    # Time complexity could be O(n^2) theoretically. However, it is unlikely to happen
    # Because in order for that to happen, they hash collision happens for all of the keys.
    # Something must be wrong with the hash function then.
    hash_keys = []
    data.each do |dt|
      next unless dt

      dt.each do |pair|
        hash_keys << pair[0]
      end
    end

    hash_keys
  end

  private

    def get_hash(key)
      hash = 0
      key  = key.is_a?(String) ? key : key.to_s
      key.chars.each_with_index do |char, index|
        hash = (hash + char.ord * index) % key.size
      end
      hash
    end
end

key        = 'grapes'
hash_table = HashTable.new(2)
puts "The computed key is: #{hash_table.instance_eval { get_hash(key) }}"
hash_table.set(key, 5)
hash_table.set('grape', 15)
hash_table.set('grapes', 888)
hash_table.set('google', 99)
print hash_table.data
print "\n"
print hash_table.keys
