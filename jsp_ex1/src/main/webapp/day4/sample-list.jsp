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
#container{
            width:460px;
            margin: 5px auto;
        }
.page {
	margin : 10px 5px;
	text-align : center;
}
a{
	padding : 5px;
	border : 1px solid #ccc;
	cursor : pointer;
	text-decoration : none;
	color : black;
	
}
.page .active{
	background-color : #ddd;
	font-weight : bold;
}
</style>
</head>
<body>
	<div id="container">
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>평균점수</th>
		</tr>
		<%		
		String sql = "SELECT S.STU_ID, STU_NAME, STU_DEPT, AVG_GRADE"
				+ " FROM TBL_STULIST S"
				+ " INNER JOIN ("
				+ " SELECT S.STU_ID, AVG(GRADE) AS AVG_GRADE"
				+ " FROM TBL_STULIST S"
				+ " INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID"
				+ " GROUP BY S.STU_ID"
				+ " ) T ON S.STU_ID = T.STU_ID"
				+ " ORDER BY AVG_GRADE DESC";
		rs = stmt.executeQuery(sql);
		try {
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("STU_ID")%></td>
			<td><a href="sample-view.jsp?stuId=<%=rs.getString("STU_ID")%>"><%=rs.getString("STU_NAME")%></a></td>
			<td><%=rs.getString("STU_DEPT")%></td>
			<td><%=rs.getString("AVG_GRADE")%> 점</td>
		</tr>
		<%
		}} catch (SQLException e) {
			out.println("DB오류");
		}
		%>
	</table>
	<div>
		<button onclick="fnStuInsert()">학생 추가</button>
	</div>
	</div>
</body>
</html>
<script>
	function fnStuInsert(){
		location.href="sample-stuInsert.jsp";
	}
</script>