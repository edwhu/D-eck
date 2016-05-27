module deck;

import std.stdio;
import std.random;
import std.algorithm.mutation;

//suit: Spades, Hearts, Diamonds, Clubs
struct Card {
  Card* previous = null;
  int rank = -1;
  int suit = -1;
  // a<b = a.opCmp(b) < 0
  //return -1 if a < b, return 1 if a >= b
  int opCmp(ref const Card a) const {
    if(this.rank < a.rank)
        return -1;
    else if(this.rank > a.rank)
      return 1;
    else {//if ranks are same
      if(this.suit < a.suit) {
        return -1;
      }
      if(this.suit == a.suit) return 0;
      return 1;
    }
  }
}


class Deck {
  Card[52] deck;
  short top = 51;
  this() {
    //initialize the deck
    for(short i = 0; i < 4; ++i){
      for(short j = 0; j < 13; ++j){
        deck[13*i + j].rank = j;
        deck[13*i + j].suit = i;
        //writeln(13*i+j);
      }
    }
  }
  ref Card opIndex(int i) { return deck[i]; }
  Card deal() {
    return deck[top--];
  }
  //the fisher-yates shuffle
  void shuffle(){
    for(short i = deck.length-1; i >=0; --i) {
      //random j from 0 <= j <= i
      int j = uniform(0,i+1);
      swap(deck[i], deck[j]);
    }
  }
  void cardPrint( ref Card a) {
    switch( a.rank ){
      default:
        write(a.rank," ");
        break;
      case 9:
        write("Jack ");
        break;
      case 10:
        write("Queen ");
        break;
      case 11:
        write("King ");
        break;
      case 12:
        write("Ace ");
        break;
    }
    write("of ");
    switch( a.suit ){
      default:
        throw new Exception("unknown suit");
      case 0:
        writeln("Clubs");
        break;
      case 1:
        writeln("Diamonds");
        break;
      case 2:
        writeln("Hearts");
        break;
      case 3:
        writeln("Spades");
        break;
    }
  }
  void print(int index = top) { cardPrint(deck[index]);}
  void printAll(){
    for(short i = 0; i <= top; ++i) print(i);
  }
}
