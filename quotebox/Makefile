all: listen qoute

listen: listen.c quotes.h quotes.c
	gcc listen.c quotes.h quotes.c -o listen

qoute: quote.c quotes.h quotes.c
	gcc quote.c quotes.h quotes.c -o quote

clean:
	rm -f listen quote
