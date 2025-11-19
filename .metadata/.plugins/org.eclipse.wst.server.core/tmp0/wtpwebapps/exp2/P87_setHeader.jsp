<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>使用response对象实现页面刷新</title>
</head>
<body>
当前时间为:
<%
    out.println(new Date().toLocaleString());
%>
<br>
3秒以后,自动刷新到setHeader1.jsp页面。
<%
    response.setHeader("Refresh", "3;url=P87_setHeader1.jsp");
%>
</body>
</html>