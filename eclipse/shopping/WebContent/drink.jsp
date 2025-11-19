<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="check.jsp" %>
<html>
<head>
    <title>饮品店</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div align="center">
<%=name %>,欢迎您选购饮品!
<form action="buy.jsp" method="post">
<select name="goods">
    <option value="啤酒">啤酒</option>
    <option value="可乐">可乐</option>
    <option value="牛奶">牛奶</option>
    <option value="咖啡">咖啡</option>
</select>
<input type="submit" value="加入购物车" />
</form>
</div>
</body>
</html>