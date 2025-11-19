<%@ page contentType="text/html;charset=utf-8" %>
<html>
    <head><title>使用response对象设置响应的内容类型</title></head>
    <body>
        <% response.setContentType("application/msword;charset=utf-8"); %>
        <h2>当前页面将以Word文档的形式打开</h2>
    </body>
</html>