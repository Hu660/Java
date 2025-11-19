<%@ page pageEncoding="utf-8" %>
<jsp:useBean id="book" class="beans.Book" />
<jsp:setProperty name="book" property="id" />
<%
    int result = book.delBook();
    String msg = "删除失败,单击确定按钮跳转到图书列表页!";
    if (result == 1) {
        msg = "删除成功,单击确定按钮跳转到图书列表页!";
    }
%>
<script>window.alert('<%=msg %>');</script>
<%
    response.setHeader("Refresh", "1;url=list.jsp");
%>