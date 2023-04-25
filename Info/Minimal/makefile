exe : main.o fichiers.o fir.o iir.o mesure.o affichage.o integration.o
	gcc main.o fichiers.o fir.o iir.o mesure.o affichage.o integration.o -o exe


main.o : main.c
	gcc -c main.c

fichiers.o : fichiers.c fichiers.h
	gcc -c fichiers.c

fir.o : fir.c fir.h
	gcc -c fir.c
	
iir.o : iir.c iir.h
	gcc -c iir.c

mesure.o : mesure.c mesure.h 
	gcc -c mesure.c
	
affichage.o : affichage.c affichage.h
	gcc -c affichage.c	
	
integration.o : integration.c integration.h
	gcc -c integration.c