<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db.jsp"%>
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
	String sql = "DELETE FROM TBL_STULIST WHERE STU_ID='" + stuId + "'";
	String sql2 = "DELETE FROM TBL_GRADE WHERE STU_ID='" + stuId + "'";
	int result = stmt.executeUpdate(sql);
	int result2 = stmt.executeUpdate(sql2);
	if (result > 0 && result2>0) {
		out.println("삭제되었습니다.");
	} else {
		out.println("삭제실패!");
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