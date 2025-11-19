<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
    String name = request.getParameter("name");
    out.println("<h3>欢迎" + name + ",登录成功!</h3>");
%>
</body>
</html>