require_relative 'linked_list'

class JungleBeats

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(list)
    list.split.each do |beat|
      @list.append(beat)
    end
  end

  def play(rate = 500, voice = "Boing")
    beats = @list.to_string
    `say -r #{rate} -v #{voice} #{beats}`
  end

  def different_settings(rate, voice)
    rate = rate
    voice = voice
  end

end
