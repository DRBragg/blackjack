SUITS = ['❤︎', '♠︎', '♣︎', '⬩']
RANKS =* ('2'..'10'), 'J', 'Q', 'K', 'A'

class Deck
  attr_reader :deck

  def initialize
    @deck = buildDeck
  end

  def buildDeck
    deckOfCards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deckOfCards << Card.new(suit, rank)
      end
    end
    deckOfCards.shuffle!
  end

  def draw!(qty)
    @deck.pop(qty)
  end
end
