<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자동 주석 ctrl + shift + / -->
	<!-- 전역변수, 메소드 선언문 -->
	<%!  
		int number = 10;
		int sum(int x, int y){
			return x+y;
		}
	%> 
	<!-- 스크립틀릿 -->
	<%
		out.print("<h1>"+number+"</h1>");
		String name = "홍길동"; //여기서 선언하면 현재 페이지 밖에서 접근 불가
		for(int i=1; i<10; i++){
			out.println(i);
		}
	%>
	<br>
	<!-- 표현식111 -->
	<%-- 표현식222(원문보기에서 생략 됨) --%>
	<div style="color:red;"><%= sum(3,5) %></div>
</body>
</html>