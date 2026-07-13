import 'package:deck_of_cards/deck_of_cards.dart';

void main() {
  var deck = Deck();
  deck.shuffle();
  print(deck.cardsWithSuit('Diamonds'));
}
