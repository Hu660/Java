<%@ page pageEncoding="utf-8" import="java.util.*" %>
<%@ include file="check.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String goods = request.getParameter("goods");
    if(goods == null){
        response.sendRedirect("success.jsp");
    } else {
        ArrayList<String> carts = (ArrayList<String>)session.getAttribute("carts");
        if(carts == null){
            carts = new ArrayList<String>();
        }
        carts.add(goods);
        session.setAttribute("carts", carts);
        response.sendRedirect("cart.jsp");
    }
%>