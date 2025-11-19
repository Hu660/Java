<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="check.jsp" %>
<html>
<head>
    <title>水果店</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div align="center">
<%=name %>,欢迎您选购水果!
<form action="buy.jsp" method="post">
<select name="goods">
    <option value="梨">梨</option>
    <option value="苹果">苹果</option>
    <option value="香蕉">香蕉</option>
    <option value="橘子">橘子</option>
</select>
<input type="submit" value="加入购物车" />
</form>
</div>
</body>
</html>