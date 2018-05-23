package ir.operand;

public class INum extends Operand{
    public int v;
    public INum(int _v) {
        v = _v;
    }
    public String toString() {
        return Integer.toString(v);
    }
}
