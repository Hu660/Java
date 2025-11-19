<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page isErrorPage="true" %>
<html>
<head><title>page指令isErrorPage属性的使用</title></head>
<body>
<h1>这是一个异常处理页面</h1>
<h2>当P67_page_errorPage.jsp页面发生异常时，可以看到本页面的内容</h2>
<b>错误描述</b><%=exception.toString() %><p>
<pre>
<%
exception.printStackTrace(new java.io.PrintWriter(out));
%>
</pre>
</body>
</html>