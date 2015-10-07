require_relative 'card'

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    add_cards
    shuffle_cards
  end

  def add_cards
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
  end

  def shuffle_cards
    @cards = cards.shuffle
  end

  def deal_card
    Card.new(:spades, :ace)
  end
end
