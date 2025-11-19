<%@ page contentType="text/html;charset=utf-8" import="java.util.Map" %>
<jsp:useBean class="util.DBUtil" id="db"/>
<html>
<head>
    <title>检查用户名是否存在</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String sql = "select * from users where username=?";
    db.setUrl("jdbc:mysql://localhost:3306/ch09?characterEncoding=utf8&serverTimezone=UTC");
    Map<String, String> m = db.getMap(sql, new String[]{username});
    if (m != null) {
        out.println("该用户名已经被占用!");
    } else {
        out.print("该用户名可用!");
    }
%>
</body>
</html>