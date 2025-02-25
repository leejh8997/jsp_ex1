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
	<div id="container">
	<%
	String stuId = request.getParameter("stuId");
	String sql = "SELECT S.STU_ID, S.STU_DEPT, G.SUBJECT, G.GRADE "
            + "FROM TBL_STULIST S "
            + "INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID "
            + "WHERE S.STU_ID = '" + stuId + "'";
	rs = stmt.executeQuery(sql);
	rs.next();
	out.println("<div>이름 : "+rs.getString("STU_ID")+"</div>");
	out.println("<div>학과 : "+rs.getString("STU_DEPT")+"</div>");
	out.println("<div>과목명 : "+rs.getString("SUBJECT")+"</div>");
	out.println("<div>점수 : "+rs.getString("GRADE")+"</div>");
	while(rs.next()){
	out.println("<div>과목명 : "+rs.getString("SUBJECT")+"</div>");
	out.println("<div>점수 : "+rs.getString("GRADE")+"</div>");
	}
	
	%>
	<div>
	<button onclick="fnDelete(<%= stuId%>)">삭제</button>
	<button onclick="fnUpdate(<%= stuId%>)">수정</button>
	</div>
	</div>
</body>
</html>
<script>
	function fnDelete(id){
		location.href="sample-delete.jsp?stuId="+id;
	}
	function fnUpdate(id){
		location.href="sample-update.jsp?stuId=" + id;
	}
</script>