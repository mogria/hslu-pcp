package com.company;

public class Stack {

    private Element top;
    private Element bottom;
    private int size = 0;

    public Stack(){
        clear();
    }

    public void push(Element e){
        if (isEmpty()){
            this.top = this.bottom = e;
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
        if(top == bottom)
        this.top = tmpTop.getNext();
        this.size--;
        return true;
    }

    public void print() {
        final Element current = top;

        if(isEmpty()) {
            System.out.println("print - Stack is empty");
            return;
        }

        System.out.print("print - Stack contains: " );

        while(current != null) {
            System.out.print(current.getValue());
            System.out.print(", ");
        }

        System.out.print("top Element = ");
        System.out.println(top.getValue());
    }

    public boolean isEmpty(){
       return this.bottom == null;
    }

    public int size() {
        return this.size;
    }

    public void clear() {
        this.top = null;
        this.bottom= null;
        this.size = 0;
    }
}
