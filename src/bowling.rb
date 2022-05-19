# frozen_string_literal: true

# initial class
class BowlingGame
  
  def initialize
    @rolls = []
    @score = 0
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    index=0
    10.times do
      if is_strike?(index) 
        result += strike_score(index)
        index+=1
      elsif is_spare?(index)
        result += spare_score(index)
        index+=2
      else
        result += frame_score(index)
        index+=2
      end
    end
    result
  end

  def is_strike?(i)
    @rolls[i] == 10
  end

  def strike_score(i)
    10 + @rolls[i+1] + @rolls[i+2]
  end

  def is_spare?(i)
    (@rolls[i] + @rolls[i+1]) == 10
  end

  def spare_score(i)
    10 + @rolls[i + 2]
  end

  def frame_score(i)
    @rolls[i]+@rolls[i+1]
  end

end