<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>搜索结果</title>
<link rel="stylesheet" href="book.css" type="text/css">
</head>
<body>
<h2 align="center">搜索结果</h2>
<table align="center" width="60%" border="1">
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>价格</th>
    </tr>
<%
    // 获取搜索参数
    String bookname = request.getParameter("bookname");
    String author = request.getParameter("author");
    
    // 数据库连接参数（请根据实际情况修改）
    String url = "jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "hhyytt2003";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        // 加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        
        // 构建查询SQL
        StringBuilder sql = new StringBuilder("SELECT * FROM book WHERE 1=1");
        if (bookname != null && !bookname.trim().isEmpty()) {
            sql.append(" AND bookname LIKE ?");
        }
        if (author != null && !author.trim().isEmpty()) {
            sql.append(" AND author LIKE ?");
        }
        
        pstmt = conn.prepareStatement(sql.toString());
        
        // 设置参数
        int paramIndex = 1;
        if (bookname != null && !bookname.trim().isEmpty()) {
            pstmt.setString(paramIndex++, "%" + bookname + "%");
        }
        if (author != null && !author.trim().isEmpty()) {
            pstmt.setString(paramIndex++, "%" + author + "%");
        }
        
        // 执行查询
        rs = pstmt.executeQuery();
        
        // 显示结果
        boolean hasResult = false;
        while (rs.next()) {
            hasResult = true;
%>
    <tr>
        <td><%= rs.getString("bookname") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getString("press") %></td>
        <td><%= rs.getString("price") %></td>
    </tr>
<%
        }
        if (!hasResult) {
%>
    <tr>
        <td colspan="4">没有找到匹配的图书信息</td>
    </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
    <tr>
        <td colspan="4">查询出错: <%= e.getMessage() %></td>
    </tr>
<%
    } finally {
        // 关闭资源
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</table>
<p align="center">
    <a href="search.html">返回搜索</a> | 
    <a href="add.html">添加图书</a>
</p>
</body>
</html>