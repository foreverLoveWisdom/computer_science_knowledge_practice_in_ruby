class Node
  attr_accessor :value, :next_node

  def initialize(val)
    @value     = val
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :length, :head, :tail

  def initialize(head = nil)
    @head = head
    @tail ||= head
    @length = head ? 1 : 0
  end

  def traverse
    current_node = head
    until current_node.nil?
      print "#{current_node.value} "
      current_node = current_node.next_node
    end
  end

  def insert_after_head(node)
    if head
      head.next_node = node
    else
      self.head = node
    end

    update_tail(node)
    update_length
  end

  def append(node)
    tail.next_node = node
    self.tail      = node
    update_length
  end

  def prepend(node)
    node.next_node = head
    self.head      = node
    update_length
  end

  def remove(index)
    out_of_index_error(index)
    return if remove_head?(index)

    node_counter = 0
    current_node = head
    while node_counter < length
      if node_counter + 1 == index
        current_node.next_node = current_node.next_node.next_node
        self.tail              = current_node if remove_tail?(index)
        update_length(:remove)
        return
      end

      node_counter += 1
      current_node = current_node.next_node
    end
  end

  def remove_tail?(index)
    index == length - 1
  end

  def remove_head?(index)
    return false unless index.zero?

    self.head = head.next_node
    update_length(:remove)
    true
  end

  def out_of_index_error(index)
    raise IndexError, 'Index is out of scope' if index >= length
  end

  def insert(index, node)
    out_of_index_error(index)
    node_counter = 0
    current_node = head

    while node_counter < length
      if node_counter + 1 == index
        node.next_node         = current_node.next_node
        current_node.next_node = node
        update_length
        return
      end

      current_node = current_node.next_node
      node_counter += 1
    end
  end

  def update_length(type = :insert)
    type == :insert ? self.length += 1 : self.length -= 1
  end

  def update_tail(node)
    if length > 1
      node.next_node = tail
    else
      self.tail = node
    end
  end

  def get_values
    node_counter = 0
    node_values  = []
    current_node = head

    while node_counter < length
      node_values << current_node.value
      current_node = current_node.next_node
      node_counter += 1
    end

    node_values
  end

  def search(index)
    out_of_index_error(index)
    node_counter = 0
    current_node = head
    while node_counter < length
      return current_node if node_counter == index

      current_node = current_node.next_node
      node_counter += 1
    end
  end
end

node = Node.new(12)
linked_list = LinkedList.new(node)
linked_list.append(Node.new(20))
linked_list.append(Node.new(30))
linked_list.append(Node.new(40))
linked_list.traverse
