package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calculator.Calculator;

@WebServlet("/cc")
public class CalculatorController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CalculatorController() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取来自页面的参数
        String value1 = request.getParameter("value1");
        String value2 = request.getParameter("value2");
        String oper = request.getParameter("oper");
        // 设置 JavaBean 属性
        Calculator cal = new Calculator();
        cal.setValue1(value1);
        cal.setValue2(value2);
        cal.setOper(oper);
        // 调用 JavaBean 的方法完成计算
        String result = cal.calculate();
        // 将结果交给 JSP 页面显示
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}