<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>setHeader1.jsp页面</title>
</head>
<body>
这里是页面setHeader1.jsp的内容
<br>
当前时间为:
<%
    out.println(new Date().toLocaleString());
%>
</body>
</html>