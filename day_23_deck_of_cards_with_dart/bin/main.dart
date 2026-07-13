import 'package:deck_of_cards/deck_of_cards.dart';

void main() {
  var deck = Deck();
  deck.shuffle();

  print('\n Only Diamonds:');
  print(deck.cardsWithSuit('Diamonds'));

  print('\n Dealt cards:');
  print(deck.deal(4));

  deck.removeCard('Ace', 'Hearts');
  print('\n Remaining cards:');
  print(deck);
}
