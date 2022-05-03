<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<title>열어본 상품 보기</title>

</head>
<body>
	당신이 열어본 상품을 알고 있다
<br>
<br>
<c:forEach var="i" items="${URLDecoder.decode(cookie.history.value,'euc_kr').split(',')}">
	<a href="/product/getProduct?prodNo=${i}&menu=search"	target="rightFrame">${i}</a><br/>
</c:forEach>
<button onclick="window.close();">닫기</button>

</body>
</html>