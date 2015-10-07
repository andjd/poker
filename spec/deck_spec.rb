require 'deck'

describe Deck do
  let(:deck) { Deck.new }

  describe "#initialize" do

    it "creates cards" do
      expect(Card).to receive(:new).exactly(52).times
      Deck.new
    end

    it "stores cards in an array" do
      expect(deck.cards.is_a?(Array)).to be true
    end
    it "makes a full deck" do
      expect(deck.cards.count).to eq(52)
    end

    it "doesn't duplicate cards" do
      expect(deck.cards.uniq {|el| el.to_a}.length).to eq(52)
    end

  end

  describe "#deal_card" do

    it "returns a card" do
      expect(deck.deal_card).to be_an_instance_of(Card)
    end
    it "returns the top card in the deck" do
      top_card = deck.cards.last
      expect(deck.deal_card).to eq(top_card)
    end
    it "removes that card from the deck" do
      top_card = deck.cards.last
      deck.deal_card
      expect(deck.cards.include?(top_card)).to be false
    end
  end
end
