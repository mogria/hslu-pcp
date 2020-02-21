package com.company;

public class Stack {

    private Element top;
    private int size = 0;

    public Stack(){
        clear();
    }

    public void push(Element e){
        if (isEmpty()){
            this.top = e;
            e.setNext(null);
        } else {
            // NOTE: in the case head == tail, next gets
            // set on head automatically as well
            e.setNext(top);
            top = e;
        }
        this.size++;
    }

    public Element top() {
        return this.top;
    }

    public boolean pop(){
        if(isEmpty()) return false;

        final Element tmpTop = this.top;
        this.top = tmpTop.getNext();
        this.size--;
        return true;
    }

    public void print() {
        Element current = top;

        if(isEmpty()) {
            System.out.println("print - Stack is empty");
            return;
        }

        System.out.print("print - Stack contains: " );

        while(current != null) {
            System.out.print(current.getValue());
            System.out.print(", ");
            current = current.getNext();
        }

        System.out.print("top Element = ");
        System.out.println(top.getValue());
    }

    public boolean isEmpty(){
       return this.top == null;
    }

    public int size() {
        return this.size;
    }

    /**
     * b.) Hier macht es Sinn ein clear() zu implementieren,
     *    Auch weil dies die gleiche Operation wie im Konstruktur.
     *
     *    Zudem bekommt man in Java jeweils nur eine *Referenz* auf ein Stack-Objekt.
     *    Deshalb macht die clear()-Methode Sinn:
     *
     *    * Um nicht immer neue Objekte allozieren zu müssen
     *    * Um Speicher freizugeben (passiert später bei der Garbage Collection)
     */
    public void clear() {
        this.top = null;
        this.size = 0;
    }
}
