<%@ page contentType="text/html;charset=utf-8" import="java.util.Map" %>
<jsp:useBean class="util.DBUtil" id="db"/>
<html>
<head>
    <title>注册信息处理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String nickname = request.getParameter("nickname");
    String sql = "select * from users where username=?";
    db.setUrl("jdbc:mysql://localhost:3306/ch09?characterEncoding=utf8&serverTimezone=UTC");
    Map<String, String> m = db.getMap(sql, new String[]{username});
    if (m != null) {
%>
        <h3>该用户名已经被占用,请<a href="javascript:history.back()">返回</a>!</h3>
<%
    } else {
        sql = "insert into users values(null,?,?,?)";
        String[] params = {username, password, nickname};
        int result = db.update(sql, params);
        if (result == 1) {
%>
            <h3>注册成功!</h3>
            <a href="userList.jsp">查看已有用户列表</a>
<%
        } else {
%>
            <h3>注册失败!请重新<a href="register.html">注册</a>!</h3>
<%
        }
    }
%>
</body>
</html>