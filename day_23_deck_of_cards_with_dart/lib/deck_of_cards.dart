class Card {
  String rank;
  String suit;

  Card(this.rank, this.suit);

  @override
  String toString() {
    return '$suit of $rank';
  }
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

  /*
  If we try to print on object of this class (Deck), it will look for a built-in method called 'toString' and prints an 'Instance of Card" to the console.
  So we can override it and tell it to print something else.
  But since this class (Deck) is tied to another class (Card), if we do the same there, we can customize the return part and print whatever we want (ex: Ace of Diamonds).
   */
  @override
  String toString() {
    return cards.toString();
  }
}
