all: deck.d patience_sort.d
	dmd -ofpsort deck.d patience_sort.d

clean:
	rm -f *.o psort
