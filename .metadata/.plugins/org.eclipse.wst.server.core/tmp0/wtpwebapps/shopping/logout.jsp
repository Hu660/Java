<%@ page contentType="text/html;charset=utf-8"%>
<%
    session.invalidate();
    out.println("正在退出,5秒后返回<a href=\"login.html\">登录页面</a>!");
    response.setHeader("Refresh","5;url=login.html");
%>