require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @@count = 0
    @head = nil
    @tail = nil
  end
  
  def append(value)
    @@count += 1
    node = Node.new(value)

    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = tail.next_node
    end
  end

  def prepend(value)
    @@count += 1
    temp = @head
    @head = Node.new(value)
    @head.next_node = temp
  end

  def size
    @@count
  end

  def at(index)

  end

  def pop
    @@count -= 1
    node = @head
    @head = @head.next_node
    node
  end

  def containes?(value)

  end

  def find(value)

  end

  def to_s
    string = ""
    current_node = @head
    until current_node == nil
      string += "( #{current_node.value} ) => "
      current_node = current_node.next_node
    end
    string += "nil"
    string
  end
end

test_list = LinkedList.new

test_list.append(1)
test_list.append(2)
test_list.append(37)

puts test_list.to_s
puts "Likned list size: #{test_list.size}"

test_list.prepend(100)

puts test_list.to_s
puts "Linked list size: #{test_list.size}"
