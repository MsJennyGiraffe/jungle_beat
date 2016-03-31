require_relative 'node'

class LinkedList

  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      append_next_node(@head, data)
    end
    data
  end

  def append_next_node(current_node, data)
    if current_node.next_node.nil?
      current_node.next_node = Node.new(data)
    else
      append_next_node(current_node.next_node, data)
    end
  end

  def count
    counter = 0
    if @head.nil?
      counter
    else
      counter += 1
      count_next_node(@head, counter)
    end
  end

  def count_next_node(current_node, counter)
    if current_node.next_node.nil?
      counter
    else
      counter += 1
      count_next_node(current_node.next_node, counter)
    end
  end

  def to_string
    if @head.nil?
      ""
    else
      string_check_nodes(@head)
    end
  end

  def string_check_nodes(current_node, beats_array = [])
    if current_node.next_node.nil?
      beats_array << current_node.data
      beats_array.join(" ")
    else
      beats_array << current_node.data
      string_check_nodes(current_node.next_node, beats_array)
    end
  end

  def insert(position, data)
    if @head.nil?
      "Not enough nodes"
    else
      insert_node(@head, position, data)
    end
  end

  def insert_node(current_node, position, data, counter = 0)
    if position - 1 == counter
      insert_at_position(current_node, data)
    else
      counter += 1
      insert_node(current_node.next_node, position, data, counter)
    end
  end

  def insert_at_position(current_node, data)
    temp_node = current_node.next_node
    current_node.next_node = Node.new(data)
    current_node.next_node.next_node = temp_node
  end

  def prepend(data)
    new_head = Node.new(data)
    new_head.next_node = @head
    @head = new_head
  end

  def includes?(data)
    if @head.data == data
      true
    else
      includes_next(@head, data)
    end
  end

  def includes_next(current_node, data)
    if current_node == nil
      false
    elsif current_node.data == data
      true
    else
      includes_next(current_node.next_node, data)
    end
  end

  def find(position, number_of_nodes)
    counter = 0
    beat_array = []
    find_nodes(position, number_of_nodes, beat_array, counter, @head)
    beat_array.join(" ")
  end

  def find_nodes(position, number_of_nodes, beat_array, counter, current_node)
    if counter == position
      number_of_nodes.times do
        beat_array << current_node.data
        current_node = current_node.next_node
      end
    else
      counter += 1
      find_nodes(position, number_of_nodes, beat_array, counter, current_node.next_node)
    end
  end

  def pop
    pop_helper(@head)
  end

   def pop_helper(current_node)
     if current_node.next_node.next_node == nil
       node_removed = current_node.next_node.data
       current_node.next_node = nil
       node_removed
     else
       pop_helper(current_node.next_node)
     end
   end

end
