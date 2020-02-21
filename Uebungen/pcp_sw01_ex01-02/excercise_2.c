//
// Created by Patrick Richner on 21.02.20.
//

#include <stdio.h>
#include "stack.h"


int main() {

    stack myStack = init();

    printf("size(myStack) = %i\n", size(myStack)); printf("isEmpty(myStack) = %i\n", isEmpty(myStack)); print(myStack);
    top(myStack);
    myStack = push(42, myStack);
    myStack = push(77, myStack);
    myStack = push(1, myStack);
    printf("size(myStack) = %i\n", size(myStack)); printf("isEmpty(myStack) = %i\n", isEmpty(myStack)); print(myStack);
}