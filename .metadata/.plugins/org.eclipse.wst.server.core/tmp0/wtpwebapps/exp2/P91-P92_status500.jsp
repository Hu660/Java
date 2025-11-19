<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>内部服务器错误的网页</title>
</head>
<body>
<h1>内部服务器错误的网页</h1>
<%
    //int SC_INTERNAL_SERVER_ERROR = 500;
    response.setStatus(500);
%>
</body>
</html>