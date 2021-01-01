# frozen_string_literal: true

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

    if @head.nil?
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
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    @@count -= 1
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?
    current_node.next_node = nil
    @tail = current_node
  end

  def containes?(value)
    current_node = @head
    until current_node.nil?
      break if current_node.value == value

      current_node = current_node.next_node
    end
    !current_node.nil? ? true : false
  end

  def find(value)
    index = 0
    current_node = @head
    until current_node.nil?
      if current_node.value == value
        return index
      else
        index += 1
        current_node = current_node.next_node
      end
    end
    -1
  end

  def to_s
    string = ''
    current_node = @head
    until current_node.nil?
      string += "( #{current_node.value} ) => "
      current_node = current_node.next_node
    end
    string += 'nil'
    string
  end
end

test_list = LinkedList.new

test_list.append(1)
test_list.append(22)
test_list.append(3000)
test_list.append(524)
test_list.append(177)

puts test_list.to_s
puts "Likned list size: #{test_list.size}"

test_list.prepend(100)

puts test_list.to_s
puts "Linked list size: #{test_list.size}"
puts

puts 'Head Node:'
p test_list.head
puts

puts 'Tail Node:'
p test_list.tail
puts

puts "Value of Node at index 3 = #{test_list.at(3).value}"

puts "Popping value from back: #{test_list.pop}"
puts test_list.to_s

puts "Linked List contains 1?: #{test_list.containes?(1)}"
puts "Linked List contains -1? #{test_list.containes?(-1)}"

puts "Index of 524: #{test_list.find(524)}"
puts "Index of 737: #{test_list.find(737)}"
