class Card {
  String rank;
  String suit;

  Card({required this.rank, required this.suit});

  @override
  String toString() {
    return '$rank of $suit';
  }
}

class Deck {
  List<Card> cards = [];

  // initialize a list of 52 cards the moment we call the Deck class
  Deck() {
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    var ranks = [
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

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = Card(suit: suit, rank: rank);
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

  // shuffle all the cards
  void shuffle() {
    cards.shuffle();
  }

  // filter cards based on a specific suit we pass on
  Iterable<Card> cardsWithSuit({required String suit}) {
    return cards.where((card) => card.suit == suit);
  }

  // deal any number of cards to the user
  List<Card> deal({required int handSize}) {
    var hand = cards.sublist(0, handSize);

    // since sublist won't remove any dealt cards from the original list, we re-write the list of cards by remaining (not dealt) cards
    cards = cards.sublist(handSize);

    return hand;
  }

  // remove a card from our deck
  void removeCard({required String rank, required String suit}) {
    cards.removeWhere((card) => card.suit == suit && card.rank == rank);
  }
}
