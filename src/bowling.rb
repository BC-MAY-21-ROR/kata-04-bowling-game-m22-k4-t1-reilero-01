# frozen_string_literal: true

# initial class
class BowlingGame
  def initialize
    @rolls = [1, 4, 4, 5, 6, 4, 5, 5, 10, nil, 0, 1, 7, 3, 6, 4, 10, nil, 2, 8]
    @score = [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    index = 0
    10.times do
      if is_strike?(index)
        result += strike_score(index)
        index += 1
      elsif is_spare?(index)
        result += spare_score(index)
        index += 2
      else
        result += frame_score(index)
        index += 2
      end
    end
    result
  end

  def is_strike?(i)
    @rolls[i] == 10
  end

  def strike_score(i)
    10 + @rolls[i + 1] + @rolls[i + 2]
  end

  def is_spare?(i)
    (@rolls[i] + @rolls[i + 1]) == 10
  end

  def spare_score(i)
    10 + @rolls[i + 2]
  end

  def frame_score(i)
    @rolls[i] + @rolls[i + 1]
  end

  def print_score
    l = @rolls.length / 2
    index = 0
    l.times do
      print "[#{@rolls[index]},#{@rolls[index + 1]}]"
      index += 2
    end
    print "\n"
    l.times do |i|
      print "[ #{@score[i]} ]"
    end
  end
end

x = BowlingGame.new
x.print_score
