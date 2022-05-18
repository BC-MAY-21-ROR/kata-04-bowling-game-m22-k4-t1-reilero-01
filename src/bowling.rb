# frozen_string_literal: true
require_relative '../src/frame'

# initial class
class BowlingGame
 
  
  def initialize
    @rolls = []
    @score = 0
  end

  def roll(pins)
     @rolls << 0
  end

  def score
    result = @rolls.sum
  end

  def welcome
    'Bienvenido a nuestro bowling game'
  end

end

# b = BowlingGame.new
# b.roll(3)
# puts b.score


# @rolls = [3,5].sum  
# 8
