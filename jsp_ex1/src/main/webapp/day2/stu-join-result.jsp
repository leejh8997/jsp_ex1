<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp"%>
	<% 
	try{
		String no = request.getParameter("stuNo");
		String name = request.getParameter("stuName");
		String dept = request.getParameter("stuDept");
		String gender = request.getParameter("stuGender");
		String sql2 = "SELECT STU_NO FROM STUDENT WHERE STU_NO ="+no;
		rs = stmt.executeQuery(sql2);
		if(rs.next()){
			out.println("번호존재");
			return;
		} 
		String sql = "INSERT INTO STUDENT(STU_NO,STU_NAME,STU_DEPT,STU_GENDER)" 
					+ "VALUES("
					+ "'" + no + "',"
					+ "'" + name + "',"
					+ "'" + dept + "',"
					+ "'" + gender+"')";
		int result = stmt.executeUpdate(sql);
		if(result != 0){
			out.println("등록됨");
		}else{
			out.println("등록안됨");
		}
	}catch(SQLException e){
		out.println("DB 오류");
	}
	
	%>
</body>
</html>