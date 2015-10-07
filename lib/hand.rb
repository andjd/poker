


class Hand
  attr_reader :cards, :player

  def initialize(player)
    @player = player
    @cards = []
  end

  def draw_card(card)
    cards << card
  end

  def flush?
    suits = Hash.new(0)
    cards.each do |card|
      suits[card.suit] += 1
    end
    suits.values.any? {|value| value == 5}
  end

  def straight?
    values = []
    cards.each do |card|
      values << card.value
    end
    if values.any? { |val| val == :Ace }
      values.delete(:Ace)
      return true if values.sort == [2, 3, 4, 5] || values.sort == [10, 11, 12, 13]
    end
    values.sort!
    values.last - values.first == 4
  end

end #class
