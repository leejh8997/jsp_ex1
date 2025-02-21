<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../db.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%
		String stuNo = request.getParameter("STU_NO");
		try{
			int result = stmt.executeUpdate("DELETE FROM STUDENT WHERE STU_NO = '" + stuNo +"'");
			if(result>0){
				out.println("삭제되었습니다.");
			}else{
				out.println("없는 데이터입니다.");
			}
		}catch(SQLException e){
			
		}
		
	%>
	
</body>
</html>