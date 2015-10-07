require 'hand.rb'

describe Hand do
  subject { Hand.new(player) }
  let(:player) { double("player") }

  describe "#initialize" do

    it "starts empty" do
      expect(subject.cards).to eq([])
    end
    it "has a player" do
      expect(subject.player).to eq(player)
    end
  end

  describe "#draw_card" do
    let(:card) { double("card") }
    it "adds given card to hand" do
      subject.draw_card(card)
      expect(subject.cards.include?(card)).to be true
    end

    # it "draws a card from the deck if no card is given" do
    #   deck = double("deck")
    #   allow(deck).to receive(:deal_card).and_return("Ace of Spades")
    #   expect
    # end
  end

  describe "#evaluate_hand" do
    it "returns the best hand"
  end

  describe "#royal_flush?" do

    it "returns true if hand is royal flush"
    it "returns false otherwise"
  end

  describe "#flush?" do
    it "returns true if hand is flush" do
      card1 = double("KH", :suit => :hearts, :value => :king )
      card2 = double("QH", :suit => :hearts, :value => :queen )
      card3 = double("5H", :suit => :hearts, :value => :five )
      card4 = double("8H", :suit => :hearts, :value => :eight )
      card5 = double("2H", :suit => :hearts, :value => :two )
      cardx = double("5S", :suit => :spades, :value => :five)
      flush_hand = [card1, card2, card3, card4, card5]
      flush_hand.each { |card| subject.draw_card(card) }

      expect(subject.flush?).to be true
    end
    it "returns false otherwise" do
      card1 = double("KH", :suit => :hearts, :value => :king )
      card2 = double("QH", :suit => :hearts, :value => :queen )
      card3 = double("5H", :suit => :hearts, :value => :five )
      card4 = double("8H", :suit => :hearts, :value => :eight )
      card5 = double("2H", :suit => :hearts, :value => :two )
      cardx = double("5S", :suit => :spades, :value => :five)
      flush_hand = [card1, card2, card3, card4, cardx]
      flush_hand.each { |card| subject.draw_card(card) }

      expect(subject.flush?).to be false
    end
  end

  describe "#straight?" do
    it "returns true if hand is straight" do
      card1 = double("KH", :suit => :hearts, :value => 13 )
      card2 = double("QH", :suit => :hearts, :value => 12)
      card3 = double("JH", :suit => :hearts, :value => 11 )
      card4 = double("10H", :suit => :hearts, :value => 10 )
      card5 = double("9H", :suit => :hearts, :value => 9 )
      cardx = double("5S", :suit => :spades, :value => 5)
      flush_hand = [card1, card2, card3, card4, card5]
      flush_hand.each { |card| subject.draw_card(card) }

      expect(subject.straight?).to be true
    end
    it "returns false otherwise" do
      card1 = double("KH", :suit => :hearts, :value => 13 )
      card2 = double("QH", :suit => :hearts, :value => 12)
      card3 = double("JH", :suit => :hearts, :value => 11 )
      card4 = double("10H", :suit => :hearts, :value => 10 )
      card5 = double("9H", :suit => :hearts, :value => 9 )
      cardx = double("5S", :suit => :spades, :value => 5)
      flush_hand = [card1, card2, card3, card4, cardx]
      flush_hand.each { |card| subject.draw_card(card) }

      expect(subject.straight?).to be false

    end

    it "find high ace straights" do
      card1 = double("KH", :suit => :hearts, :value => 13 )
      card2 = double("QH", :suit => :hearts, :value => 12)
      card3 = double("JH", :suit => :hearts, :value => 11 )
      card4 = double("10H", :suit => :hearts, :value => 10 )
      card_ace = double("AH", :suit => :hearts, :value => :Ace )
      flush_hand = [card1, card2, card3, card4, card_ace]
      flush_hand.each { |card| subject.draw_card(card) }

      expect(subject.straight?).to be true

    end

    it "finds low ace straights" do
      card1 = double("2S", :suit => :spades, :value => 2)
      card2 = double("3H", :suit => :hearts, :value => 3 )
      card3 = double("4H", :suit => :hearts, :value => 4)
      card4 = double("5H", :suit => :hearts, :value => 5 )
      card_ace = double("AH", :suit => :hearts, :value => :Ace )
      flush_hand = [card1, card2, card3, card4, card_ace]
      flush_hand.each { |card| subject.draw_card(card) }

      expect(subject.straight?).to be true
    end

  end

end
