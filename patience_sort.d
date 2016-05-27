import deck;
import std.stdio;

void main() {
  Deck deck = new Deck();
  deck.shuffle();
  //begin patience sorting
  Card[][] piles;
  //sort the deck into different piles
  for(int i = 0; i < 52; ++i) {
    Card currentCard = deck.deal();
    //initial case
    if(piles.length == 0)
      piles~=[currentCard];
    int pileFound = 0;
    for(int j = 0; j < piles.length; ++j) {
      if (piles[j][$-1] > currentCard){
        //backtrack logic
        if(j != 0){
          //link top card from previous pile
          currentCard.previous = &(piles[j-1][$-1]);
        }
        piles[j]~=currentCard;
        pileFound = 1;
        break;
      }
    }
    if(!pileFound){
      //link top card from previous pile
      currentCard.previous = &(piles[$-1][$-1]);
      piles~=[currentCard];
    }
  }
  //writeln("piles: ", piles);
  //return sequence formed by rightmost top Card
  Card rightCard = piles[$-1][$-1];
  int increasing_subsequence_length = 1;
  deck.cardPrint(rightCard);
  while(rightCard.previous != null) {
    ++increasing_subsequence_length;
    Card temp = *(rightCard.previous);
    deck.cardPrint(temp);
    rightCard = temp;
  }
  writeln("piles length: ", piles.length, " subsequence length: ", increasing_subsequence_length);
  assert(piles.length == increasing_subsequence_length);
}
