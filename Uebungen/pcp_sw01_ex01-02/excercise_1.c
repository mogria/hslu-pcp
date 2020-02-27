#include <stdio.h>
//
// Created by Patrick Richner on 21.02.20.
//
/*
 * Die folgende Code-Sequenz:
printNumbersGoto(7);
printf("= printNumbersGoto(7)\n"); printNumbersFor(7);
printf("= printNumbersFor(7)\n"); printNumbersRecursiveFunction(7);
printf("= printNumbersRecursiveFunction(7)\n");
 *
 *
 * soll dabei beispielsweise die folgende Konsolenausgabe produzieren:
0 1 2 3 4 5 6 7 = printNumbersGoto(7)
0 1 2 3 4 5 6 7 = printNumbersFor(7)
0 1 2 3 4 5 6 7 = printNumbersRecursiveFunction(7)
 *
 */

void printNumberGoto(int n){
    int i = 0;

    loop_back:

    printf("%d ", i);

    i++;

    if( i <= n ) {
        goto loop_back;
    }

    return;
}

void printNumberFor(int n){
    for (int i = 0; i <= n; ++i) {
        printf("%d ", i);
    }

    return;
}

/* void printNumberRecursiveFunction_Recurse(int i, int n) { */
/*     if(i > n) return; */
/*     printf("%d ", i); */
/*  */
/*     printNumberRecursiveFunction_Recurse(i + 1, n); */
/* } */
/*  */
/* void printNumberRecursiveFunction(int n) { */
/*     printNumberRecursiveFunction_Recurse(0, n); */
/* } */



void printNumberRecursiveFunction(int n) {
    if(n > 0) {
        printNumberRecursiveFunction(n - 1);
    }

    printf("%d ", n);
}



int main(){
    printNumberGoto(7);
    printf("= printNumbersGoto(7)\n");
    printNumberFor(7);
    printf("= printNumbersFor(7)\n");
    printNumberRecursiveFunction(7);
    printf("= printNumbersRecursiveFunction(7)\n");
    return 0;
}

