require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("plop")
  end

  def test_node_creates_nodes
    assert_equal Node, @node.class
  end

  def test_data_returns_one_beat
    assert_equal "plop", @node.data
  end

  def test_data_can_be_different
    node = Node.new("beep")
    assert_equal "beep", node.data
  end

  def test_next_node_returns_nil_when_there_are_no_next_nodes
    assert_equal nil, @node.next_node
  end

end
