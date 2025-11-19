<%@ page pageEncoding="utf-8" import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理系统</title>
<link rel="stylesheet" href="book.css" type="text/css">
</head>
<body>
<h2 align="center">图书管理系统</h2>
<p align="center"><a href="add.html">添加图书信息</a></p>
<table align="center" width="50%" border="1">
    <tr><<th>书名</</th><<th>作者</</th><<th>出版社</</th><<th>价格</</th><<th>管理</</th></tr>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book?characterEncoding=utf8&serverTimezone=UTC", "root", "hhyytt2003");
        String sql = "select * from bookinfo";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int id = rs.getInt(1);
    %>
            <tr><td><%=rs.getString("bookname") %></td>
            <td><%=rs.getString("author") %></td>
            <td><%=rs.getString("press") %></td>
            <td><%=rs.getFloat("price") %></td>
            <td><a href="edit.jsp?id=<%=id%>">修改</a>&nbsp;
            <a href="del.jsp?id=<%=id%>" onclick="return confirm('确定要删除吗？')">删除</a></td></tr>
    <%
        }
        rs.close();
        stmt.close();
        con.close();
    %>
</table>
</body>
</html>