package utils;

public class Pair<E, F> {
    private E first;
    private F second;
    public Pair(){
    }
    public Pair(E _e, F _f){
        first = _e;
        second = _f;
    }
    public E getFirst() {
        return first;
    }
    public void setFirst(E first) {
        this.first = first;
    }
    public F getSecond() {
        return second;
    }
    public void setSecond(F second) {
        this.second = second;
    }
}