package ir.inst;

public class FuncCall extends Inst {
    public String name;
    public int n;
    public FuncCall(String _name, int _n){
        name = _name;
        n = _n;
    }

    public String toString() {
        String tmp = "\t" + "FuncCall " + name + " Param_size : " + n + "\n";
        return tmp;
    }

}
