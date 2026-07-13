import 'package:deck_of_cards/deck_of_cards.dart';

void main() {
  var deck = Deck();
  deck.shuffle();

  print('\n Only Diamonds:');
  print(deck.cardsWithSuit(suit: 'Diamonds'));

  print('\n Dealt cards:');
  print(deck.deal(handSize: 4));

  deck.removeCard(rank: 'Ace', suit: 'Hearts');
  print('\n Remaining cards:');
  print(deck);
}
