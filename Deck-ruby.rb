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
    value_sorted_deck = []
    deck_copy = @deck.clone
    lowest_value = 15

    for card in deck_copy 
      if card[:value] < lowest_value 
        lowest_value = card[:value]
      end
    end

    while deck_copy.length != 0
      card_to_add_index = deck_copy.index {|card| card[:value] == lowest_value}

      if !card_to_add_index
        lowest_value += 1
      else  
        card_to_add = deck_copy.slice!(card_to_add_index)
        value_sorted_deck.push(card_to_add)
      end
    end
    return value_sorted_deck
  end

  def sort_by_suit
    suit_sorted_deck = []
    deck_copy = @deck.clone

    suits = ['clubs', 'diamonds', 'hearts', 'spades']
    suit_index = 0

    while deck_copy.length != 0
      card_to_add_index = deck_copy.index {|card| card[:suit] == suits[suit_index]}
      if ! card_to_add_index
        suit_index += 1
      else
        card_to_add = deck_copy.slice!(card_to_add_index)
        suit_sorted_deck.push(card_to_add)
      end
    end
    return suit_sorted_deck
  end

  def sort_by_value_then_suit
    value_suit_sorted_deck = []
    deck_copy = @deck.clone
    
    lowest_value = 15
    for card in deck_copy 
      if card[:value] < lowest_value 
        lowest_value = card[:value]
      end
    end

    suits = ['clubs', 'diamonds', 'hearts', 'spades']
    suit_index = 0

    while deck_copy.length != 0
      card_to_add_index = deck_copy.index {|card| card[:value] == lowest_value and card[:suit] == suits[suit_index]}

      if !card_to_add_index and suit_index < 4
        suit_index += 1
      elsif !card_to_add_index
        lowest_value += 1
        suit_index = 0
      else  
        card_to_add = deck_copy.slice!(card_to_add_index)
        value_suit_sorted_deck.push(card_to_add)
      end
    end

    return value_suit_sorted_deck
  end
  def sort_by_suit_then_value
    suit_value_sorted_deck = []
    deck_copy = @deck.clone

    suits = ['clubs', 'diamonds', 'hearts', 'spades']
    suit_index = 0

    while deck_copy.length != 0
      lowest_value = 15
      for card in deck_copy 
        if card[:value] < lowest_value and card[:suit] == suits[suit_index]
          lowest_value = card[:value]
        end
      end

      card_to_add_index = deck_copy.index {|card| card[:value] == lowest_value and card[:suit] == suits[suit_index]}

      if !card_to_add_index and lowest_value < 15
        lowest_value += 1
      elsif !card_to_add_index
        suit_index += 1
        lowest_value = 15
      else
        card_to_add = deck_copy.slice!(card_to_add_index)
        suit_value_sorted_deck.push(card_to_add)
      end
    end

    return suit_value_sorted_deck
  end

end

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

    def test_sort_by_suit
      suits = ['clubs', 'diamonds', 'hearts', 'spades', 'clubs', 'clubs', 'diamonds']
      values = [5, 7, 2, 4, 5, 6, 2]
      @deck.feed(suits, values)

      expected = [
        { suit: 'clubs', value: 5 },
        { suit: 'clubs', value: 5 },
        { suit: 'clubs', value: 6 },
        { suit: 'diamonds', value: 7 },
        { suit: 'diamonds', value: 2 },
        { suit: 'hearts', value: 2 },
        { suit: 'spades', value: 4 },
      ]
      assert_equal expected, @deck.sort_by_suit
    end

    def test_sort_by_value_then_suit
      suits = ['clubs', 'diamonds', 'hearts', 'spades', 'clubs', 'clubs', 'diamonds']
      values = [5, 7, 2, 4, 5, 6, 2]
      @deck.feed(suits, values)

      expected = [
        { suit: 'diamonds', value: 2 },
        { suit: 'hearts', value: 2 },
        { suit: 'spades', value: 4 },
        { suit: 'clubs', value: 5 },
        { suit: 'clubs', value: 5 },
        { suit: 'clubs', value: 6 },
        { suit: 'diamonds', value: 7 },
      ]
      assert_equal expected, @deck.sort_by_value_then_suit
    end

    def test_sort_by_suit_then_value
      suits = ['clubs', 'diamonds', 'hearts', 'spades', 'clubs', 'clubs', 'diamonds']
      values = [5, 7, 2, 4, 5, 6, 2]
      @deck.feed(suits, values)

      expected = [
        { suit: 'clubs', value: 5 },
        { suit: 'clubs', value: 5 },
        { suit: 'clubs', value: 6 },
        { suit: 'diamonds', value: 2 },
        { suit: 'diamonds', value: 7 },
        { suit: 'hearts', value: 2 },
        { suit: 'spades', value: 4 },
      ]
      assert_equal expected, @deck.sort_by_suit_then_value
    end
  end