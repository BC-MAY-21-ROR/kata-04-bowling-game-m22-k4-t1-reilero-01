# frozen_string_literal: true

# initial class
class BowlingGame
  def initialize
    @rolls = []
    generate_random
    @score = [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
  end

  def generate_random
    index = 0
    10.times do
      numA = rand(0..10)
      numB = rand(0..10)

      if numA == 10
        @rolls[index] = numA
        @rolls[index + 1] = nil
        index += 2
      elsif (numA + numB) == 10
        @rolls[index] = numA
        @rolls[index + 1] = numB
        index += 2
      else
        @rolls[index] = numA
        x = 10 - numA
        numC = rand(0..x - 1)
        @rolls[index + 1] = numC
        index += 2
      end
    end
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
    i = 0
    l.times do
      print "Frame #{i + 1}: "
      print "[#{@rolls[index]}"
      if @rolls[index + 1] != nil
        print ",#{@rolls[index + 1]}]"
      else
        print ']'
      end
      print " - #{@score[i]} \n"
      index += 2
      i += 1
    end
  end
end

game = BowlingGame.new
# game.score
game.print_score
