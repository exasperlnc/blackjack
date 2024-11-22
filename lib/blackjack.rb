# Create a deck of cards
class Deck
  def initialize()
    @cards = self.create_cards
  end
end

class Game
  def initialize()
    @cards = self.create_cards
    @dealer_hand = []
    @player_hand = []
    @dealer_hidden = []
  end

  def start
    self.shuffle    
    
    self.dealer_draw

    self.player_draw
  end
  
  def request_player_input
    puts "The dealer has a #{@dealer_hand.first.value}. You have a #{@player_hand.first.value} and a #{@player_hand[1].value}. Would you like to Hit or Hold?"
    selection = gets
  end

  def finish_turn

  end

  def winner?

  end

  def create_cards
    cards = []

    values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10]

    4.times do
      values.each do |v|
        cards << Card.new(v)
      end
    end
    return cards
  end

  def shuffle
    return @cards
  end

  def dealer_draw
    @dealer_hand << @cards.pop()
    @dealer_hidden << @cards.pop()
  end 

  def player_draw
    @player_hand << @cards.pop()
    @player_hand << @cards.pop()
  end
end

class Card
  attr_reader :value
  def initialize(value)
    @value = value 
  end
end
# Draw two cards from the deck, giving the player two and the dealer two
game = Game.new()
game.start
# allow the player to hit or hold
game.request_player_input
# let the computer flip over its second card and draw until it hits 17
game.finish_turn
# determine the winner
game.winner?
# ruby ./lib/blackjack.rb  
# run the file with above command ^^