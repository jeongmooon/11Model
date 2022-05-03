<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/product/image" enctype="multipart/form-data" method="post">
		<input type="file" name="file" accept="image/*" />
		<button type="submit">작성</button>
	</form>
</body>
</html>