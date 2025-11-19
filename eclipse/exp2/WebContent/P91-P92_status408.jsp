<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>请求超时的网页</title>
</head>
<body>
<h1>请求超时的网页</h1>
<%
    //int SC_REQUEST_TIMEOUT = 408;
    response.setStatus(408);
%>
</body>
</html>