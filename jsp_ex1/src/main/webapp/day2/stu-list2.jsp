<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, th, td {
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
	<%@ include file="../db.jsp"%>
	<table>
		<tr>
			<th>선택</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>
		
		<%
		try {
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			while (rs.next()) {
				
		%>
		
		<tr>
			<td><input type="radio" name="student" value="<%= rs.getString("STU_NO")%>"></td>
			<td><%= rs.getString("STU_NO") %></td>
			<td>
				<a href="stu-view.jsp?stuNo=<%= rs.getString("STU_NO")%>"><%= rs.getString("STU_NAME") %></a>
			</td>
			<td><%= rs.getString("STU_DEPT") %></td>
			<td><%= rs.getString("STU_GENDER").equals("M") ? "남자" : "여자" %></td>
		</tr>
				
		<% 
			}
		} catch (SQLException e) {
			out.println("오류발생!");
		}
		%>
	</table>
	<div>
		<button onclick="fnStuRemove()">삭제</button>
	</div>
</body>
</html>
<script>
	function fnStuRemove(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		let select = document.querySelector("input[name='student']:checked");
		location.href="stu-delete.jsp?STU_NO="+select.value;
	}
</script>