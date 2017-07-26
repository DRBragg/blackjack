require "spec_helper"

RSpec.describe Card do
  it 'should contain the suit' do
    card = Card.new('❤︎', 'A')
    expect(card.suit).to_be('❤︎')
  end

  it 'should contain the value' do
    card = Card.new('❤︎', 'A')
    expect(card.value).to_be('A')
  end

  describe '#faceCard' do
    it 'should have a method to check if a card is a face card' do
      card = Card.new('❤︎', 'A')
      expect(card.faceCard?).to_be(false)
      card2 = Card.new('❤︎', 'J')
      expect(card.faceCard?).to_be(true)
    end
  end
end
