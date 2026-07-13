class Card {
  String rank;
  String suit;

  Card(this.rank, this.suit);
}

class Deck {
  List<Card> cards = [];

  // initialize a list of 52 cards the moment we call the Deck class
  Deck() {
    var ranks = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    var suits = [
      'Ace',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Jack',
      'Queen',
      'King',
    ];

    for (var rank in ranks) {
      for (var suit in suits) {
        var card = Card(rank, suit);
        cards.add(card);
      }
    }
  }
}
