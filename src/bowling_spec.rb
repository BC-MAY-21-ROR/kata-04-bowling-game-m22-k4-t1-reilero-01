# frozen_string_literal: true
require_relative 'bowling'

describe BowlingGame do
  describe '#newgame' do
    it 'printwelcome' do
      @bowl = BowlingGame.new
      expect(@bowl.welcome).to eq('Bienvenido a nuestro bowling game')
    end
  end
end
