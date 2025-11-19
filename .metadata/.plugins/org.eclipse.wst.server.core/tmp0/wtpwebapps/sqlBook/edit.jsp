<%@ page pageEncoding="utf-8" import="java.sql.*" %>
<html>
<head>
<title>修改图书信息</title>
<link rel="stylesheet" href="book.css" type="text/css">
<script type="text/javascript" src="book.js"></script>
</head>
<body>
<%
    String id = request.getParameter("id");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book?characterEncoding=utf8&serverTimezone=UTC", "root", "hhyytt2003");
    String sql = "select * from bookinfo where id=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(id));
    ResultSet rs = pstmt.executeQuery();
    if (rs.next()) {
        String bookname = rs.getString("bookname");
        String author = rs.getString("author");
        String press = rs.getString("press");
        float price = rs.getFloat("price");
%>
        <h2 align="center">修改图书信息</h2>
        <form name="form1" onSubmit="return check()" action="edit_do.jsp" method="post">
            <input type="hidden" name="id" value="<%=id%>">
            <table align="center" width="30%" border="1">
                <tr><<th width="30%">书名:</</th>
                    <td><input type="text" name="bookname" value="<%=bookname%>"></td></tr>
                <tr><<th>作者:</</th>
                    <td><input type="text" name="author" value="<%=author%>"></td></tr>
                <tr><<th>出版社:</</th>
                    <td><input type="text" name="press" value="<%=press%>"></td></tr>
                <tr><<th>价格:</</th>
                    <td><input type="text" name="price" value="<%=price%>"></td></tr>
                <tr><<th colspan="2">
                <input type="submit" value="修改">
                <input type="reset" value="重置"></</th></tr>
            </table>
        </form>
<%
    }
    rs.close();
    pstmt.close();
    con.close();
%>
</body>
</html>