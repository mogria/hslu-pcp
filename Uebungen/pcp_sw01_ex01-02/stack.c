/*
 * Stack implementation based on a array.
 * 
 * Author: ruedi.arnold@hslu.ch
 */

#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

// returns new empty stack

stack init() {
    stack s;
    s.index = STACK_EMPTY_INDEX;
    return s;
}

// adds element to stack

stack push(element e, stack s) {
    if (s.index + 1 < STACK_SIZE) {
        // there is space for one more element
        s.index++;
        s.stackArray[s.index] = e;
    } else {
        printf("ERROR - push: stack full! Cannot add %i\n", e);
    }
    return s;
}

// returns top element

element top(stack s) {
    if (s.index > STACK_EMPTY_INDEX) {
        return s.stackArray[s.index];
    } else {
        printf("ERROR - top: stack empty!\n");
        return STACK_DUMMY_ELEMENT;
    }
}

// removes topelement from stack

stack pop(stack s) {
    if (s.index > STACK_EMPTY_INDEX) {
        s.index--;
    }
    return s;
}

// prints all elements

void print(stack s) {
    if (s.index > STACK_EMPTY_INDEX) {
        printf("print - Stack contains: ");
        int i;
        for (i = 0; i <= s.index; i++) {
            printf("%i, ", s.stackArray[i]);
        }
        printf("top element = %i\n", s.stackArray[s.index]);
    } else {
        printf("print - Stack is empty\n");
    }
}

// is the stack empty?
int isEmpty(stack s) {
    if (s.index <= STACK_EMPTY_INDEX){
        return 1;
    } else{
        return 0;
    }
}

// how many elements are there on the stack
int size(stack s) {
    return s.index + 1;
}

// ja man könnte noch ein clear() definieren, jedoch hätte dies
// nicht viel nutzen da die init() methode eine komplette kopie
// des stack structs zurückgibt. Man könnte damit also
// keinen Speicher freigeben.
//
// Der einzige nutzen wäre explizit alle gespeicherten elemente aus dem
// speicher löschen zu können (gebrauchte elemente werden nicht resetted auf einen "standardwert")
//
//
// Achtung: dies bringt gar nichts, weil nur die Kopie gecleared wird!!!!
//
//
/* void clear(stack s) { */
/*     s.index = STACK_EMPTY_INDEX; */
/*  */
/*     for (int i = 0; i < STACK_SIZE; i++) { */
/*         s.stackArray[i] = STACK_DUMMY_ELEMENT; */
/*     } */
/*  */
/*     return; */
/* } */
