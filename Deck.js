class Deck {
  constructor(deckConstructor = []) {
    this.deck = [...deckConstructor];
  }
  feed(suits, values) {
    this.deck = suits.reduce((acc, curr, index) => {
      acc.push({
        suit: curr,
        value: values[index]
      });
      return acc;
    }, []);
    return this.deck;
  }
  sortByValue() {
    const valueSortedDeck = [];
    const deckCopy = [...this.deck];
    let lowestValue = 15;
    //find the lowest value
    deckCopy.forEach((card) => {
      if(card.value < lowestValue) lowestValue = card.value;
    });

    //remove items from deckCopy only when the value matches the lowestValue, if none are found increase lowestValue
    while(deckCopy.length) {
      const cardToAddIndex = deckCopy.findIndex(card => card.value === lowestValue);

      if(cardToAddIndex === -1) lowestValue++;
      else valueSortedDeck.push(deckCopy.splice(cardToAddIndex, 1)[0]);
    }
    return valueSortedDeck;
  }
  
  sortBySuit() {
    const suitSortedDeck = [];
    const deckCopy = [...this.deck];
    
    const suits = ['clubs', 'diamonds', 'hearts', 'spades'];
    let suitIndex = 0;

    while(deckCopy.length) {
      const cardToAddIndex = deckCopy.findIndex(card => card.suit === suits[suitIndex]);

      if(cardToAddIndex === -1) suitIndex++;
      else suitSortedDeck.push(deckCopy.splice(cardToAddIndex, 1)[0]);
    }
    return suitSortedDeck;
  }
  sortByValueThenSuit() {
    const valueSuitSortedDeck = [];
    const deckCopy = [...this.deck];
    let lowestValue = 15;
    deckCopy.forEach((card) => {
      if(card.value < lowestValue) lowestValue = card.value;
    });

    const suits = ['clubs', 'diamonds', 'hearts', 'spades'];
    let suitIndex = 0;

    while(deckCopy.length) {
      const cardToAddIndex = deckCopy.findIndex(card => (card.value === lowestValue && card.suit === suits[suitIndex]));

      if(cardToAddIndex === -1 && suitIndex < 4) suitIndex++;
      else if(cardToAddIndex === -1) {
        lowestValue++; 
        suitIndex = 0;
      }
      else valueSuitSortedDeck.push(deckCopy.splice(cardToAddIndex, 1)[0]);
    }
    return valueSuitSortedDeck;

  }
  sortBySuitThenValue() {
    const suitValueSortedDeck = [];
    const deckCopy = [...this.deck];

    const suits = ['clubs', 'diamonds', 'hearts', 'spades'];
    let suitIndex = 0;

    while(deckCopy.length) {
      let lowestValue = 15;
      deckCopy.forEach((card) => {
        if(card.value < lowestValue && card.suit === suits[suitIndex]) lowestValue = card.value;
      });

      const cardToAddIndex = deckCopy.findIndex(card => (card.value === lowestValue && card.suit === suits[suitIndex]));

      if(cardToAddIndex === -1 && lowestValue < 15) lowestValue++;
      if(cardToAddIndex === -1) {
        suitIndex++;
        lowestValue = 15;
      } 
      else suitValueSortedDeck.push(deckCopy.splice(cardToAddIndex, 1)[0]);
    }
    return suitValueSortedDeck;

  }
}

module.exports = { Deck };
