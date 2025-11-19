<%@ page pageEncoding="utf-8" import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String bookname = request.getParameter("bookname");
    String author = request.getParameter("author");
    String press = request.getParameter("press");
    String price = request.getParameter("price");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book?characterEncoding=utf8&serverTimezone=UTC", "root", "hhyytt2003");
    String sql = "update bookinfo set bookname=?,author=?,press=?,price=? where id=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, bookname);
    pstmt.setString(2, author);
    pstmt.setString(3, press);
    pstmt.setFloat(4, Float.parseFloat(price));
    pstmt.setInt(5, Integer.parseInt(id));
    int result = pstmt.executeUpdate();
    String msg = "修改失败，单击确定按钮跳转到图书列表页！";
    if (result == 1) {
        msg = "修改成功，单击确定按钮跳转到图书列表页！";
    }
    pstmt.close();
    con.close();
%>
<script>window.alert('<%=msg %>');</script>
<%
    response.setHeader("Refresh", "1;url=list.jsp");
%>