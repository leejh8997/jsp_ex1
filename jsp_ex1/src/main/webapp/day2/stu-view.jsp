<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="stu-update.jsp" name="update">
	<%
	String stuNo = request.getParameter("stuNo");
	rs = stmt.executeQuery(
			"SELECT * FROM STUDENT S LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO WHERE S.STU_NO = '" + stuNo + "'");
	if (rs.next()) {
		String no = rs.getString("STU_NO");
		String name = rs.getString("STU_NAME");
		String dept = rs.getString("STU_DEPT");
		String stuGrade = rs.getString("STU_GRADE");
		out.println("<div> 학번 : " + no + "</div>");
		out.println("<div> 이름 : " + name + "</div>");
		out.println("<div> 학과 : " + dept + "</div>");
		out.println("<div> 학년 : " + stuGrade + "</div>");
		if (rs.getString("ENR_GRADE") == null) {
			String grade = rs.getString("ENR_GRADE");
			out.println("<div> 점수 : " + grade + "</div>");
		} else {
			out.println("<div> 점수 : 시험 안봄</div>");
		}
		if (rs.next()) {
			String grade2 = rs.getString("ENR_GRADE");
			out.println("<div> 점수 : " + grade2 + "</div>");
		}
	} else {
		out.println("조회 실패");
	}
	%>
	<input name="stuNo" value="<%=stuNo%>" hidden>
	<input type="submit" value="수정">
	</form>
</body>
</html>