class Hand
  attr_reader :playerHand, :computerHand
  def initialize(deck)
    @deck = deck
    @playerHand = drawHand
    @computerHand = drawHand
  end

  def drawHand
    @deck.draw!(2)
  end

  def hit
    @deck.draw!(1)
  end

  def score(hand)
    score = 0
    hand.each do |card|
      score += card.scoring.to_i
      if card.value == "A" && score > 21
        score -= 10
      end
    end
    score
  end
end
