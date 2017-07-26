require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

class Game
  attr_accessor :deck, :hands, :player, :computer, :nextMove, :playerBust, :computerBust, :playerScore, :computerScore

  def initialize
    @deck = Deck.new
    @hands = Hand.new(deck)
    @player = hands.playerHand
    @computer = hands.computerHand
    @i = 2
    @j = 2
    @playerBust = false
    @computerBust = false
    @nextMove = ''
    @playerScore = 0
    @computerScore = 0
  end

  def checkPlayerScore(playerScore)
    if playerScore > 21
      puts "Bust! Game Over"
      @playerBust = true
      @playerScore = 0
      scoreGame #looping here
    else
      puts "Player score: #{playerScore}"
      @playerScore = playerScore
    end
  end

  def dealPlayer
    puts "Player was dealt #{player[0].value} of #{player[0].suit}'s"
    puts "Player was dealt #{player[1].value} of #{player[1].suit}'s"
    checkPlayerScore(hands.score(player))
    playerMove
  end

  def playerHit
    @player += hands.hit
    puts "\nPlayer was dealt #{player[@i].value} of #{player[@i].suit}'s"
    @i += 1
    checkPlayerScore(hands.score(player))
    playerMove
  end

  def playerMove
    if @playerBust == false
      print "\nHit or stand (h/s): "
      @nextMove = gets.chomp
        if nextMove.downcase == 'h'
          @nextMove = ''
          playerHit
        elsif nextMove.downcase == 's'
          puts "You stand"
          dealDealer
        else
          puts "Try again"
          playerMove
        end
    end
  end

  def checkDealerScore(dealerScore)
    if dealerScore > 21
      puts "Dealer Busts! Game Over"
      @computerBust = true
      @computerScore = dealerScore
      scoreGame #looping here
    else
      puts "Dealer score: #{dealerScore}"
      @computerScore = dealerScore
    end
  end

  def dealDealer
    puts "\nDealer was dealt #{computer[0].value} of #{computer[0].suit}'s"
    puts "Dealer was dealt #{computer[1].value} of #{computer[1].suit}'s"
    dealerMove
  end

  def dealerHit
    puts "\nDealer hits"
    @computer += hands.hit
    puts "\nDealer was dealt #{computer[@j].value} of #{computer[@j].suit}'s"
    @j += 1
    dealerMove
  end

  def dealerMove
    checkDealerScore(hands.score(computer))
    if @computerScore < 17
      dealerHit
    else
      puts "\nDealer stands\n\n"
      scoreGame
    end
  end

  def scoreGame
    playerScore = @playerScore
    computerScore = @computerScore
    if playerScore > computerScore || @computerBust == true
      puts "You Win!"
    elsif computerScore > playerScore || @playerBust == true
      puts "Dealer Wins!"
    else
      puts "Tie Game!"
    end
  end


  def playGame
    dealPlayer
  end
end

newGame = Game.new
newGame.playGame
