<%@ page contentType="text/html; charset=utf-8" %>
<jsp:useBean class="calculator.Calculator" scope="page" id="calculator">
<jsp:setProperty name="calculator" property="*" />
</jsp:useBean>
<html>
<head>
<title>计算结果</title>
</head>
<body>
<%
    try {
        String result = calculator.calculate();
        out.println(calculator.getValue1() + calculator.getOper() + 
                    calculator.getValue2() + "=" + result);
        out.println("<a href=calculator.html>返回</a>");
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
</body>
</html>