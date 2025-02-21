<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,
    tr,
    th,
    td {
        text-align: center;
        border: 2px solid #bbb;
        border-collapse: collapse;
        padding: 5px;
    }

    th {
        color: rgb(132, 39, 219);
        background-color: aliceblue;
        /* font-size: 30px; */
    }
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>	
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>	
			<%				
				try{
					rs = stmt.executeQuery("SELECT * FROM STUDENT");	
					while(rs.next()){
						String gender = rs.getString("STU_GENDER").equals("M") ? "남자" : "여자";
						out.println("<tr>");
						out.println("<td>"+rs.getString("STU_NO") + "</td>");
						out.println("<td>"+rs.getString("STU_NAME") + "</td>");
						out.println("<td>"+rs.getString("STU_DEPT") + "</td>");
						out.println("<td>"+ gender + "</td>");
						out.println("</tr>");				
					}			
				}catch(SQLException e){
					out.println("오류발생!");
				}
			%>		
	</table>
</body>
</html>