require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/jungle_beats'

class JungleBeatsTest < Minitest::Test
  def setup
    @jb = JungleBeats.new
  end

  def test_when_jb_is_made_a_linked_list_is_instantiated
    assert_equal nil, @jb.list.head
  end

  def test_when_multiple_words_are_input_append_will_make_nodes
    @jb.append("words and stuff")
    assert_equal "words and stuff", @jb.list.to_string
  end

  def test_when_multiple_words_are_input_append_will_put_them_into_seperate_nodes
    @jb.append("words and stuff")
    assert_equal 3, @jb.list.count
  end

  def test_the_head_will_be_populated
    @jb.append("words and stuff")
    assert_equal "words", @jb.list.head.data
  end

  def test_jungle_beats_sings
    @jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom ")
    assert_equal "", @jb.play
  end

  def test_jungle_beats_sings_differently
    @jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom ")
    assert_equal "", @jb.play(1000, "whisper")
  end

  def test_jungle_beats_sings_like_a_lady
    @jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom ")
    assert_equal "", @jb.play(100, "Princess")
  end

end
