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
    puts selection
    validate_selection(selection)
  end

  def validate_selection(selection)
    if selection.downcase.chomp == "hit"
      # add one to player hand
    elsif selection.downcase.chomp == "hold"
      # end player turn
    else  
      puts "Invalid request. Please type 'hit' or 'hold'. "
      selection = gets
      validate_selection(selection)
    end
  end

  def dealer_turn
    dealer_total = self.calculate_dealer_total
    while dealer_total < 17
      card = @cards.pop
      dealer_total += card.value
    end
  end

  def winner?
    player_total = self.calculate_player_total
    dealer_total = self.calculate_dealer_total
    if player_total > 21
      puts "#{player_total}?! Busted!"
    elsif dealer_total > 21
      puts "The house busts with a #{dealer_total}!"
    elsif player_total > dealer_total
      puts "#{player_total} beats #{dealer_total}. You win!"
    elsif player_total == dealer_total 
      puts "Tie game. (Would be a push if you're gambling)"
    else 
      puts "#{dealer_total} beats #{player_total}. You lose! Loser."
    end 
  end
  
  def calculate_player_total
    player_total = 0
    @player_hand.each do |card|
      player_total += card.value
    end 
    player_total
  end

  def calculate_dealer_total
    dealer_total = @dealer_hidden.first.value
    @dealer_hand.each do |card|
      dealer_total += card.value
    end
    dealer_total 
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
    @cards.shuffle!
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
game.dealer_turn
# determine the winner
game.winner?
# ruby ./lib/blackjack.rb  
# run the file with above command ^^