class HashTable
  attr_accessor :data

  def initialize(size)
    @data = Array.new(size)
  end

  def set(key, value)
    address = get_hash(key)

    unless data[address]
      data[address] = []
      data[address].push([key, value])
    end
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
print hash_table.data
