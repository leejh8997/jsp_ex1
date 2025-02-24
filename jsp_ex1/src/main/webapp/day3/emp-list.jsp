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
</style>
</head>
<body>
<%-- 	<form action="emp-d-chart.jsp?deptno="+<%=rs.getString("DEPTNO") %> method="get" name="dChart"> --%>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>급여</th>
			<th>급여등급</th>
			<th>팀장(사수)</th>
			<th>부서명</th>
		</tr>
		<%
		String sql = "SELECT E.EMPNO, E.ENAME, E.SAL, GRADE, NVL(E2.ENAME,' ') AS NAME, DNAME, E.DEPTNO" + " FROM EMP E"
				+ " LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO" + " INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL"
				+ " INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO" + " ORDER BY GRADE DESC";
		rs = stmt.executeQuery(sql);
		try {
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("EMPNO")%></td>
			<td><%=rs.getString("ENAME")%></td>
			<td><%=rs.getInt("SAL")%></td>
			<td><%=rs.getInt("GRADE")%></td>
			<td><a href="emp-t-chart.jsp?"><%=rs.getString("NAME")%></a></td>
			<td><a href="emp-d-chart.jsp?deptNo=<%= rs.getString("DEPTNO")%>"><%=rs.getString("DNAME")%></a></td>
		</tr>
		<%
		}
		} catch (SQLException e) {
		out.println("DB오류");
		}
		%>


	</table>
<!-- 	</form> -->
</body>
</html>
<script>
</script>