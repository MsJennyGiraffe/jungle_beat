require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test

  def setup
    @list = LinkedList.new
  end

  def test_linked_list_creates_a_linked_list
    assert_equal LinkedList, @list.class
  end

  def test_when_no_data_is_present_head_returns_nil
    assert_equal nil, @list.head
  end

  def test_head_returns_nil_when_asked_for_next_node_when_there_is_only_one_beat_in_list
    @list.append("doop")
    assert_equal nil, @list.head.next_node
  end

  def test_count_method_counts_the_number_of_nodes_in_list
    @list.append("doop")
    assert_equal 1, @list.count
  end

  def test_append_fills_head_with_data_when_there_are_no_nodes
    assert_equal "doop", @list.append("doop")
  end

  def test_append_can_add_a_next_node
    append_nodes(["beeps", "bloops"])
    assert_equal "bloops", @list.head.next_node.data
  end

  def test_append_can_add_two_nodes
    append_nodes(["beeps", "bloops"])
    assert_equal 2, @list.count
  end

  def test_append_count_multiple_nodes
    append_nodes(["beeps", "bloops", "moot"])
    assert_equal 3, @list.count
  end

  def test_to_string_returns_the_data_of_the_nodes_in_a_string
    @list.append("doop")
    assert_equal "doop", @list.to_string
  end

  def test_to_string_returns_a_string_of_two_nodes
    append_nodes(["beeps", "bloops"])
    assert_equal "beeps bloops", @list.to_string
  end

  def test_to_string_returns_a_string_of_three_nodes
    append_nodes(["beep", "boop", "shi", "shoe"])
    assert_equal "beep boop shi shoe", @list.to_string
  end

  def test_insert_creates_a_node_and_places_it_after_the_position_being_called
    append_nodes(["beep", "boop", "shi", "shoe"])
    @list.insert(1, "hello")
    assert_equal "beep hello boop shi shoe", @list.to_string
  end

  def test_insert_can_insert_at_the_second_position
    append_nodes(["beep", "boop", "shi", "shoe"])
    @list.insert(2, "hello")
    assert_equal "beep boop hello shi shoe", @list.to_string
  end

  def test_insert_can_insert_at_the_first_position
    append_nodes(["beep", "boop", "shi", "shoe"])
    @list.insert(3, "hello")
    assert_equal "beep boop shi hello shoe", @list.to_string
  end

  def test_prepend_sets_node_as_head_and_shifts_all_other_nodes
    append_nodes(["beep", "boop", "shi"])
    @list.prepend("dop")
    assert_equal "dop beep boop shi", @list.to_string
  end

  def test_includes_can_find_beats_and_return_true
    append_nodes(["beep", "boop", "shi"])
    assert @list.includes?("beep")
  end

  def test_another_includes_can_find_beats_and_return_true
    append_nodes(["beep", "boop", "shi"])
    assert @list.includes?("boop")
  end

  def test_if_includes_doesnt_find_beat_it_returns_false
    append_nodes(["beep", "boop", "shi"])
    refute @list.includes?("fruit")
  end

  def test_find_can_find_at_zeroth_position_and_retrieve_one_data
    append_nodes(["beep", "boop", "shi"])
    assert_equal "beep", @list.find(0, 1)
  end

  def test_find_can_find_at_first_position_and_retrieve_one_data
    append_nodes(["beep", "boop", "shi"])
    assert_equal "boop", @list.find(1, 1)
  end

  def test_find_finds_things
    append_nodes(["beep", "boop", "shi"])
    assert_equal "shi", @list.find(2, 1)
  end

  def test_find_finds_two_things
    append_nodes(["beep", "boop", "shi"])
    assert_equal "beep boop", @list.find(0, 2)
  end

  def test_find_finds_multiple_things
    append_nodes(["beep", "boop", "shi"])
    assert_equal "beep boop shi", @list.find(0, 3)
  end

  def test_pop_returns_the_last_node_of_the_list
    append_nodes(["beep", "boop", "shi"])
    assert_equal "shi", @list.pop
  end

  def test_pop_removes_the_last_node_of_the_list
    append_nodes(["beep", "boop", "shi"])
    @list.pop
    assert_equal "beep boop", @list.to_string
  end

  def test_pop_removes_the_last_node_of_the_list
    append_nodes(["beep", "boop", "shi", "bop", "pop"])
    @list.pop
    assert_equal "beep boop shi bop", @list.to_string
  end

  private

  def append_nodes(collection)
    collection.each do |data|
      @list.append(data)
    end
  end

end
