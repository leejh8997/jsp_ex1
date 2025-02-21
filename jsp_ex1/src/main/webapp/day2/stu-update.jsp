<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>20153075
</style>
</head>
<body>
	<form action="stu-update-result.jsp" method="get" name="update">
		<%
		String stuNo = request.getParameter("stuNo");
		rs = stmt.executeQuery("SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo +"'");
		rs.next();
		%>

		<div>
			이름 : <input name="stuName" value="<%=rs.getString("STU_NAME") %>">
		</div>
		<div>
			학과 : <input name="stuDept" value="<%=rs.getString("STU_DEPT") %>">
		</div>
		<div>
			<input name="stuNo" value="<%=stuNo%>" hidden>
			<input type="submit" value="저장" >
		</div>
	</form>

</body>
</html>

