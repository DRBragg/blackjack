class Card
  attr_reader :suit, :value, :scoring

  def initialize(suit, value)
    @suit = suit
    @value = value
    @scoring = valueAmount
  end

  def valueAmount
    if ['J', 'K', 'Q'].include?(@value)
      @scoring = 10
    elsif @value == 'A'
      @scoring = 11
    else
      @scoring = @value.to_i
    end
  end
end
