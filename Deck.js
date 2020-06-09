
class Deck {
  constructor(deckConstructor = []) {
    this.deck = [...deckConstructor]
  }
  feed = (suits, values ) => {
    this.deck = suits.reduce((acc, curr, index) => {
      acc.push({
        suit: curr,
        value: values[index]
      })
      return acc
    }, [])
    return this.deck
  }
  sortByValue = () => {
    const valueSortedDeck = []
    const deckCopy = [...this.deck]
    let lowestValue = 15
    //find the lowest value
    deckCopy.forEach((card) => {
      if (card.value < lowestValue) lowestValue = card.value
    })

    //remove items from deckCopy only when the value matches the lowestValue, if none are found increase lowestValue
    while(deckCopy.length) {
      const cardToAddIndex = deckCopy.findIndex(card => card.value === lowestValue)

      if(cardToAddIndex === -1) lowestValue++;
      else valueSortedDeck.push(deckCopy.splice(cardToAddIndex, 1)[0])
    }
    return valueSortedDeck
  }
  
  sortBySuit = () => {

  }
  sortByValueThenSuit = () => {

  }
  sortBySuitThenValue = () => {

  }
};

module.exports = { Deck }