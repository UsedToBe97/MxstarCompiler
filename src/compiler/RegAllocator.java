package compiler;

import ir.Func;
import ir.Ir;
import ir.inst.*;
import ir.operand.addr.MemAddr;
import ir.operand.reg.Reg;
import ir.operand.reg.X86Reg;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class RegAllocator {
    public Ir rt;
    public void visit(Inst x) {x.accept(this);}
    public void visit(Binop x) {
        x.add(x.lhs);
        x.add(x.rhs);
        x.add2(x.dest);
        x.set(x.dest);
    }
    public void visit(Call x) {
        for (Inst u : x.Insts) visit(u);
    }
    public void visit(CJump x) {
        x.add(x.lhs);
        x.add(x.rhs);
    }
    public void visit(FuncCall x) {
        int tmp = (x.n > 6) ? 6 : x.n;
        x.add2(X86Reg.rax);
        x.set(X86Reg.rax);
        for (int i = 0; i < tmp; ++i) x.add(X86Reg.getparam(i));
    }
    public void visit(Move x) {
        x.add(x.src);
        x.add2(x.dest);
        x.set(x.dest);
    }
    public void visit(UnaryOp x) {
        x.add(x.src);
        x.set(x.src);
    }
    public void visit(Label x) {}
    public void visit(Jump x) {}
    public boolean Contain(Set<Reg> in, Set<Reg> out) {
        if (in.size() < out.size()) return false;
        for (Reg t : out) if (!in.contains(t)) return false;
        return true;
    }
    public boolean ok(Inst ins, Set<Reg> in) {
        if (ins instanceof Binop) {
            if (((Binop) ins).dest instanceof MemAddr) return false;
            if (((Binop) ins).dest instanceof Reg) in.remove(((Binop) ins).dest);
        }
        if (ins instanceof UnaryOp) {
            if (((UnaryOp) ins).src instanceof MemAddr) return false;
            if (((UnaryOp) ins).src instanceof Reg) in.remove(((UnaryOp) ins).src);
        }
        if (ins instanceof Move) {
            if (((Move) ins).dest instanceof MemAddr) return false;
            if (((Move) ins).dest instanceof Reg) in.remove(((Move) ins).dest);
        }
        return !(ins instanceof FuncCall);
    }
    public ArrayList<Inst> DeadCodeElimination(ArrayList<Inst> insts) {
        ArrayList<Inst> tmp = new ArrayList<>();
        int sz = insts.size();
        for (int i = 0; i < sz; ++i) {
            Inst ins = insts.get(i);
            int ed = i - 1, mx = -1;
            if (ins.del) continue;
            if (ins instanceof FuncCall) continue;
            if (ins instanceof Jump) continue;
            if (ins instanceof Jump) {
                int x = insts.indexOf(((Jump) ins).label);
                if (x < i) continue;
                else if (mx < x) mx = x;
            }
            if (ins instanceof CJump) {
                int x = insts.indexOf(((CJump) ins).dest);
                if (x < i) continue;
                else if (mx < x) mx = x;
            }
            Set<Reg> in = ins.in;
            for (int j = i; j < sz - 1; ++j) {
                Inst ins2 = insts.get(j);
                Set<Reg> out = new HashSet<>();
                if (!ok(ins2, in)) break;
                else if (ins2 instanceof Move && ((Move) ins2).dest instanceof X86Reg && ((Move) ins2).dest == X86Reg.rax) break;
                else if (ins2 instanceof Jump) {
                    int x = insts.indexOf(((Jump) ins2).label);
                    if (x < i) break;
                    else if (mx < x) mx = x;
                    out = ((Jump) ins2).label.in;
                } else if (ins2 instanceof CJump) {
                    int x = insts.indexOf(((CJump) ins2).dest);
                    if (x < i) break;
                    else if (mx < x) mx = x;
                    out = ((CJump) ins2).dest.in;
                } else if (ins2.nxt != null ) out = ins2.nxt.in;
                if (Contain(in, out)) ed = j;
            }
            if (ed >= mx && ed >= i) for (int j = i; j <= ed; ++j) insts.get(j).del = true;
        }
        for (Inst ins : insts)
            if (!ins.del || ins instanceof Label) tmp.add(ins);
        return tmp;
    }

    public void alloc(Func x) {
        if (x.num > 800) return;
        x.opt = true;
        ArrayList<Inst> orders = new ArrayList<>();
        Inst pre = null;
        for (Inst u : x.Insts) {
            if (u instanceof Call) {
                for (Inst u2 : ((Call) u).Insts) {
                    orders.add(u2);
                    if (pre != null) pre.nxt = u2;
                    pre = u2;
                }
                continue;
            }
            orders.add(u);
            if (u instanceof CJump) ((CJump) u).dest.from.add(u);
            if (u instanceof Jump) {
                ((Jump) u).label.from.add(u);
                if (pre != null) pre.nxt = u;
                pre = null;
                continue;
            }
            if (pre != null) pre.nxt = u;
            pre = u;
        }
        for (Inst u : orders) visit(u);
        boolean need = true;
        int cc = 0;
        while (need) {
            need = false;
            ++cc;
            for (int i = orders.size() - 1; i >= 0; --i) {
                Inst u = orders.get(i);
                if (u instanceof CJump) {
                    need |= gao(u, ((CJump) u).dest.in);
                }
                if (u instanceof Jump) {
                    need |= gao(u, ((Jump) u).label.in);
                    continue;
                }
                if (u.nxt != null) need |= gao(u, u.nxt.in);
            }
        }

        x.Insts = DeadCodeElimination(orders);
//        System.err.println(cc);

        boolean[][] map = new boolean[x.num][x.num];
        int[] col = new int[x.num];
        int[] vis = new int[x.num];
        x.tag = new boolean[16];
        for (Inst u : orders) {
            if (u instanceof CJump) color(u.def, ((CJump) u).dest.in, map);
            if (u instanceof Jump) {
                color(u.def, ((Jump) u).label.in, map);
                continue;
            }
            if (u.nxt != null) color(u.def, u.nxt.in, map);
        }
        for (int i = 0; i < 16; ++i) {
            col[i] = i;
            x.tag[i] = false;
            vis[i] = 0;
        }
        for (int i = 16; i < x.num; ++i) {
            col[i] = -1;
            vis[i] = 0;
        }
        int dfn = 0;
        for (int i = 16; i < x.num; ++i) {
            ++dfn;
            for (int j = 0; j < x.num; ++j)
                if (map[i][j] && col[j] != -1) vis[col[j]] = dfn;
            for (int j = 0; j < x.num; j = (j == 9 ? 16 : j + 1))
                if (vis[j] != dfn) {
                    col[i] = j;
                    x.Regs.get(i).idx = j;
                    if (j < 16) x.tag[j] = true;
                    break;
                }
        }
    }

    public boolean gao(Inst inst, Set<Reg> out) {
        boolean ok = false;
        for (Reg u : out) {
            if (u != inst.def && !inst.in.contains(u)) {
                inst.in.add(u);
                ok = true;
            }
        }
        return ok;
    }

    public void color(Reg def, Set<Reg> out, boolean[][] map) {
        if (def == null) return;
        for (Reg u : out) map[def.idx][u.idx] = map[u.idx][def.idx] = true;
    }

    public Ir work(Ir root) {
        rt = root;
        for (Func u : rt.Funcs) alloc(u);
        return rt;
    }


}
