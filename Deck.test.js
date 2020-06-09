const { Deck } = require('./Deck');
// import Deck from './Deck'

describe('deck-sort-challenge', () => {
  const deck = new Deck;
  it('takes in two arrays and returns an array of objects', () => {
    const suits = ['clubs', 'diamonds', 'hearts', 'spades', 'clubs', 'clubs', 'diamonds'];
    const values = [5, 7, 2, 4, 5, 6, 2];
    const expected = [
      { suit: 'clubs', value: 5 },
      { suit: 'diamonds', value: 7 },
      { suit: 'hearts', value: 2 },
      { suit: 'spades', value: 4 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 6 },
      { suit: 'diamonds', value: 2 },
    ];
    expect(deck.feed(suits, values)).toEqual(expected);
  });
  it('sorts by value', () => {
    const expected = [
      { suit: 'hearts', value: 2 },
      { suit: 'diamonds', value: 2 },
      { suit: 'spades', value: 4 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 6 },
      { suit: 'diamonds', value: 7 },
    ];
    expect(deck.sortByValue()).toEqual(expected);
  });
  it('sorts by suit', () => {
    const expected = [
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 6 },
      { suit: 'diamonds', value: 7 },
      { suit: 'diamonds', value: 2 },
      { suit: 'hearts', value: 2 },
      { suit: 'spades', value: 4 },
    ];
    expect(deck.sortBySuit()).toEqual(expected);
  });
  it('sorts by value then suit', () => {
    const expected = [
      { suit: 'diamonds', value: 2 },
      { suit: 'hearts', value: 2 },
      { suit: 'spades', value: 4 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 6 },
      { suit: 'diamonds', value: 7 },
    ];
    expect(deck.sortByValueThenSuit()).toEqual(expected);
  });
  it('sorts by suit then value', () => {
    const expected = [
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 5 },
      { suit: 'clubs', value: 6 },
      { suit: 'diamonds', value: 2 },
      { suit: 'diamonds', value: 7 },
      { suit: 'hearts', value: 2 },
      { suit: 'spades', value: 4 },
    ];
    expect(deck.sortBySuitThenValue()).toEqual(expected);
  });
});
