require 'test/unit' 

class Deck
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
  end

  def feed(suits, values)
    # reduce suits and values and put them in deck
    @deck = suits.each_with_index.inject([]) do |acc, (curr, index)|
      acc.push({
        :suit => curr,
        :value => values[index]
      })
    end
    
    return @deck
  end

  def sort_by_value
    value_sorted_deck = @deck
    #deck_copy = deck copied so you can mutate
    lowest_value = 15
    #deck_copy loop through to find lowest value

    #while deck_copy length > 0 do...
    #find index in deck copy of the card with the lowest value

    #if card_to_add_index is not found increase lowest_value
    #else push deck_copy[card_to_add_index] to value_sorted_deck
    return value_sorted_deck
  end

  def sort_by_suit
    suit_sorted_deck = []
    #deck_copy = deck copied so you can mutate

    suits = ['clubs', 'diamonds', 'hearts', 'spades']
    suit_index = 0

    #while deck_copy length > 0 do...
    #find index in deck copy of the card with clubs, then diamonds etc
    #if no index is found increase suit_index
    #else push deck_copy[card_to_add_index] to suit_sorted_deck
    return suit_sorted_deck
  end

end

puts 'test worked!!!'

class TestDeck < Test::Unit::TestCase
    def setup
      @deck = Deck.new([])
    end

    def test_newDeck
      suits = ['clubs', 'diamonds', 'hearts', 'spades', 'clubs', 'clubs', 'diamonds']
      values = [5, 7, 2, 4, 5, 6, 2]

      expected = [
        { :suit => 'clubs', :value => 5 },
        { :suit => 'diamonds', :value => 7 },
        { :suit => 'hearts', :value => 2 },
        { :suit => 'spades', :value => 4 },
        { :suit => 'clubs', :value => 5 },
        { :suit => 'clubs', :value => 6 },
        { :suit => 'diamonds', :value => 2 },
      ]

      assert_equal expected, @deck.feed(suits, values) 
    end

    def test_sort_by_value
      suits = ['clubs', 'diamonds', 'hearts', 'spades', 'clubs', 'clubs', 'diamonds']
      values = [5, 7, 2, 4, 5, 6, 2]
      @deck.feed(suits, values)
      expected = [
      { suit: 'hearts', value: 2 },
      { suit: 'diamonds', value: 2 },
      { suit: 'spades', value: 4 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 6 },
      { suit: 'diamonds', value: 7 },
    ]
      assert_equal expected, @deck.sort_by_value
    end
  end