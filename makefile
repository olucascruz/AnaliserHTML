analiser: analiser.y analiser.l
	bison -d analiser.y
	flex -o analiser.l.c analiser.l
	gcc -o analiser analiser.l.c analiser.tab.c -lfl -lm 

clean:
	rm -f *.c *.h analiser

