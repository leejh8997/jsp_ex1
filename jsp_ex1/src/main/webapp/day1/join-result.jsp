<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.Arrays" %>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd1");
		String name = request.getParameter("userName");
		String phone1 = request.getParameter("phone1");
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
// 		String hobbyList = Arrays.toString(hobby);
	%>
	<div>이름 : <%= id %></div>
	<div>비밀번호 : <%= pwd %></div>
	<div>이름 : <%= name %></div>
	<div>번호 : <%= phone1 %></div>
	<div>성별 : <%= gender.equals("M") ? "남자" : "여자" %></div>
	<div>취미 : <%-- <%= hobbyList %> --%>
		<% for(int i=0; i<hobby.length; i++){
			out.println(hobby[i]);
		} %>
	</div>
	
</body>
</html>