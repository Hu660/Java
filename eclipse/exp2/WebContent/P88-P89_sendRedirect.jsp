<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head><title>页面重定向</title></head>
<body>
<h1>
<%
    //页面重定向到 sendRedirect1.jsp
    response.sendRedirect("P88-P89_sendRedirect1.jsp?name=Jack");
%>
</h1>
</body>
</html>