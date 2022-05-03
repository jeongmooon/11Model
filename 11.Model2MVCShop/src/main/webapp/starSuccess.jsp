<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	setTimeout(success(), 1000);
	function success(){
		opener.parent.location.reload();
		window.close();
	}
</script>
<body>
	<h1 onClick="success();">등록완료</h1>
</body>
</html>