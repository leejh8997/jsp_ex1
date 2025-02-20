<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	
	<jsp:include page="number.jsp"></jsp:include> <!-- 컴파일한 후에 결과를 가지고 옴 -->
	<%@ include file="number.jsp" %>  <%-- 이 상태로 데이터를 가지고 옴<%!int a = 10;int b = 20;%><%= a+b %> --%> 	
	<%= a %>
	<div>메인!!!!!!!!!!!</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>