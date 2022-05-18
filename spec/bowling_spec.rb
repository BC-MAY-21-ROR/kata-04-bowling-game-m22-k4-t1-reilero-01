# frozen_string_literal: true
require 'rspec'
require_relative '../src/bowling'
#require_relative  '/src/frame'

describe BowlingGame do
  describe '#newgame' do
    it 'printwelcome' do
      @bowl = BowlingGame.new
      expect(@bowl.welcome).to eq('Bienvenido a nuestro bowling game')
    end

    it 'can create game' do
      @bowl = BowlingGame.new
      expect(@bowl.score).to eq(0)
    end  

    it 'no pin game' do
      @bowl = BowlingGame.new
      1.times{@bowl.roll(0)}
      expect(@bowl.score).to eq(0)
    end
    
      # it 'perfect game' 
      #   12.times{@game.roll(10)}
      #   expect(@game.score).to eq(300)
     
    
  end
end
