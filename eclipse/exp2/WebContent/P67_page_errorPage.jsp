<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page errorPage="P68_page_isErrorPage.jsp" %>
<html>
<head>page指令 errorPage属性的使用</head>
<body>
<h1>这个页面的运行会发生异常，将转去page_isErrorPage.jsp</h1>
<%
int a=30;
int b=0;
a=a/b;
%>
</body>
</html>