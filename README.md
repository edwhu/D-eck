#Deck in D
A deck of cards in D! Uses the fisher-yates algorithm for an efficient
and unbiased shuffle.
```
import deck;
Deck deck = new Deck();
deck.shuffle();
Card[] myPokerHand = [deck.deal(),deck.deal()];
Card[] yourPokerHand = [deck.deal(), deck.deal()];
```
#Patience Sort Algorithm:
##Longest increasing subsequence. Given a sequence of elements c1, c2, …, cn
##from a totally-ordered universe, find the longest increasing subsequence.
```
make
./psort
```
Implementation of the patience sort algorithm to solve this problem with a deck
of cards.
O( n log(n) )
```
