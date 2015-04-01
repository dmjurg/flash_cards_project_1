require_relative 'spec_helper'
require_relative '../app'
require_relative '../lib/card'

describe 'list all cards' do
  it 'should return a list of the flash cards' do
    expect Card.all.to_not be_nil
  end
end

describe 'add a new card' do
  it 'should add a card' do
    count_before = Card.all.count
    expect(Card.all.count)
  end
end    
