all: PROJET

PROJET: main.o affichage.o fichiers.o fir.o iir.o integration.o mesure.o
	gcc -o PROJET main.o affichage.o fichiers.o fir.o iir.o integration.o mesure.o

main.o: main.c
	gcc -c main.c

affichage.o: affichage.c
	gcc -c affichage.c

fichiers.o: fichiers.c
	gcc -c fichiers.c

fir.o: fir.c
	gcc -c fir.c

iir.o: iir.c
	gcc -c iir.c

integration.o: integration.c
	gcc -c integration.c

mesure.o: mesure.c
	gcc -c mesure.c

clean:
	rm -f *.o