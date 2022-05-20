# frozen_string_literal: true

require 'rspec'
require_relative '../src/bowling'

describe BowlingGame do
  it 'can create game' do
    bowl = BowlingGame.new
  end

  it 'no pin game' do
    bowl = BowlingGame.new
    20.times { bowl.roll(0) }
    expect(bowl.score).to eq(0)
  end

  it 'only 1 pin game' do
    bowl = BowlingGame.new
    20.times { bowl.roll(1) }
    expect(bowl.score).to eq(20)
  end

  it 'roll a spare' do
    bowl = BowlingGame.new
    bowl.roll(8)
    bowl.roll(2)
    bowl.roll(1)
    17.times { bowl.roll 0 }
    expect(bowl.score).to eq(12)
  end

  it 'roll a strike' do
    bowl = BowlingGame.new
    bowl.roll(10)
    bowl.roll(3)
    bowl.roll(2)
    16.times { bowl.roll 0 }
    expect(bowl.score).to eq(20)
  end

  it 'roll a perfect game' do
    bowl = BowlingGame.new
    12.times { bowl.roll 10 }
    expect(bowl.score).to eq(300)
  end
end
