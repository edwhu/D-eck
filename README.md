#Deck in D
My first experience with the D programming language.
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
##Longest increasing subsequence. Given a sequence of elements c1, c2, …, cn from a totally-ordered universe, find the longest increasing subsequence.
```
make
./psort
```
Implementation of the patience sort algorithm to solve this problem with a deck
of cards.
O( n log(n) )

Remarks on D:
So far, so good. It wasn't too far of a jump from C++ to D but I'm already
loving the differences. The single class declaration syntax is a breath of
fresh air after C++'s tendency of double declarations (one in the header,
one in the implementation). D's native dynamic arrays are awesome. I did not
get to use Array Slices yet but perhaps in my next project I will.
