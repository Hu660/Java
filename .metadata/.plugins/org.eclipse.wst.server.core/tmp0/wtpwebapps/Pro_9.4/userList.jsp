<%@ page contentType="text/html;charset=utf-8" import="java.util.*" %>
<jsp:useBean class="util.DBUtil" id="db"/>
<html>
<head>
    <title>用户信息列表</title>
</head>
<body>
    <h2 align="center">用户信息列表</h2>
    <table border align="center" width="50%">
        <tr>
            <<th>序号</</th>
            <<th>用户名</</th>
            <<th>昵称</</th>
        </tr>
<%
    String sql = "select * from users";
    db.setUrl("jdbc:mysql://localhost:3306/ch09?characterEncoding=utf8&serverTimezone=UTC");
    List<Map<String, String>> users = (List<Map<String, String>>) db.getList(sql, null);
    int i = 1;
    for (Map<String, String> user : users) {
%>
        <tr>
            <td align="center"><%=i %></td>
            <td align="center"><%=user.get("username") %></td>
            <td align="center"><%=user.get("nickname") %></td>
        </tr>
<%
        i++;
    }
%>
    </table>
</body>
</html>