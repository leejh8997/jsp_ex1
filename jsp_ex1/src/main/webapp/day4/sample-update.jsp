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
		
		String stuId = request.getParameter("stuId");
	 	try{
		String sql = "UPDATE TBL_STULIST SET STU_DEPT = '소프트웨어' WHERE STU_ID='"+stuId+"'";
		int result = stmt.executeUpdate(sql);
		
		if(result>0){
			out.println("수정되었습니다.");
		}else{
			out.println("수정실패!");
		}
	 	}catch(SQLException e){
	 		out.println(e.getMessage());
	 	}

	%>
	<button onclick="fnBack()">되돌아가기</button>
</body>
</html>
<script>
	function fnBack() {
		location.href = "sample-list.jsp"
	}
</script>