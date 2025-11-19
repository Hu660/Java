package calculator;

public class Calculator {
    // 属性定义
    private String value1 = "";
    private String value2 = "";
    private String oper = "";

    // 属性的 get 与 set 方法
    public String getValue1() {
        return value1;
    }

    public void setValue1(String value1) {
        this.value1 = value1;
    }

    public String getValue2() {
        return value2;
    }

    public void setValue2(String value2) {
        this.value2 = value2;
    }

    public String getOper() {
        return oper;
    }

    public void setOper(String oper) {
        this.oper = oper;
    }

    // 相应业务方法
    public String calculate() {
        double d1 = 0.0;
        double d2 = 0.0;
        double result = 0.0;
        d1 = Double.parseDouble(value1);
        d2 = Double.parseDouble(value2);
        if (oper.equals("+")) {
            result = d1 + d2;
        } else if (oper.equals("-")) {
            result = d1 - d2;
        } else if (oper.equals("*")) {
            result = d1 * d2;
        } else if (oper.equals("/")) {
            result = d1 / d2;
        }
        return "" + result;
    }
}