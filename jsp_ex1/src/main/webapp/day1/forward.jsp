<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>test</div>
	<jsp:forward page="forward-view.jsp">
		<jsp:param value="hong123" name="userId"></jsp:param>
		<jsp:param value="30" name="userAge"></jsp:param>
	</jsp:forward>
</body>
</html>