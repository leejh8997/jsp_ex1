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
	<%
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String subject = request.getParameter("subject");
		String grade = request.getParameter("grade");
		String sql = "INSERT INTO TBL_STULIST VALUES('"+stuId+"', '"+stuName+"', '"+stuDept+"')";
		String sql2	= "INSERT INTO TBL_GRADE VALUES('"+stuId+"', '"+subject+"', '"+grade+"')";
		try{
			int result = stmt.executeUpdate(sql);
			int result2 = stmt.executeUpdate(sql2);
			if(result>0 && result2>0){
			out.println("저장되었습니다.");
			}
		}catch(SQLException e){
			out.println("DB오류");
		}
	%>
	<button onclick="fnBack()">되돌아가기</button>
</body>
</html>
<script>
	function fnBack(){
		location.href = "sample-list.jsp"
	}
</script>