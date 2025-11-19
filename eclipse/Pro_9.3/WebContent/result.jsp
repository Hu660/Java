<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>计算结果</title>
</head>
<body>
<%
    String value1 = request.getParameter("value1");
    String value2 = request.getParameter("value2");
    String oper = request.getParameter("oper");
    String result = (String) request.getAttribute("result");
%>
<%=value1%><%=oper%><%=value2%>=<%=result%>
</body>
</html>