<%@ page import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="check.jsp" %>
<html>
<head><title>购物车</title></head>
<body>
<%@ include file="header.jsp" %>
<div align="center">
<%
    // 修正：将 sessionAtt 改为 session
    ArrayList<String> carts = (ArrayList<String>) session.getAttribute("carts");
    if(carts == null){
        out.println(name+"的购物车为空!");
    }else{
        out.println(name+"的购物车中包括:");
        for(String c:carts){
            out.print(c+"&nbsp;");
        }
        out.println();
    }
%>
</div>
</body>
</html>