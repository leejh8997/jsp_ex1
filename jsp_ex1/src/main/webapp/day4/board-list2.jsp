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
.page a{
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
	<div>
		<input id="keyword" placeholder="검색어" value="<%=request.getParameter("keyword")%>">
		<button onclick="fnSearch()" >검색</button>
	</div>
	<select id="number" onchange="fnNumber(this.value)">
		
		<option value="3">3개씩</option>
		<option value="5">5개씩</option>
		<option value="10">10개씩</option>
		<option value="15">15개씩</option>
		<option value="20">20개씩</option>
	</select>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<%		
		int pageSize = 5; // 한페이지에 몇개씩 보여줄지
		int currentPage = 1;
		String keyword = "";
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("size") != null){
			pageSize = Integer.parseInt(request.getParameter("size"));
		}
		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword");
		}
		ResultSet rsCnt = stmt.executeQuery("SELECT COUNT(*) AS TOTAL FROM BOARD WHERE TITLE LIKE '%"+keyword+"%'");
		rsCnt.next();
		int total = rsCnt.getInt("TOTAL");
		int pageList = (int) Math.ceil((double)total/pageSize);
		// ceil(올림), round(반올림), floor(내림)
		int offset = ((currentPage-1)*pageSize);
		String sql = "SELECT B.BOARDNO, B.TITLE, USERID, CNT, TO_CHAR(B.CDATETIME,'YYYY-MM-DD') AS CDATETIME, CMTCNT"
				+ " FROM BOARD B"
				+ " LEFT JOIN("
				+ " SELECT B.BOARDNO, COUNT(B.BOARDNO) AS CMTCNT"
				+ " FROM BOARD B"
				+ " INNER JOIN BOARD_COMMENT C ON B.BOARDNO = C.BOARDNO"
				+ " GROUP BY B.BOARDNO) T ON B.BOARDNO = T.BOARDNO"
				+ " WHERE TITLE LIKE '%"+keyword+"%'"
				+ " ORDER BY B.BOARDNO"
				+ " OFFSET "+ offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
		rs = stmt.executeQuery(sql);
		try {
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td>
				<%=rs.getString("TITLE")%>
				<% 
					
					if(rs.getString("CMTCNT") != null){
						out.println(" ("+rs.getString("CMTCNT")+")");
					}
				%>
			</td>
			<td><%=rs.getString("USERID")%></td>
			<td><%=rs.getString("CNT")%></td>
			<td><%=rs.getString("CDATETIME")%></td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="page">
		
		<%
		if(currentPage!=1){
			out.println("<a href='?page="+(currentPage - 1) + "&size=" + pageSize + "&keyword="+ keyword + "'> ◀ </a>");
		}
		
		for(int i=1; i<=pageList; i++){
			if(currentPage == i){
				out.println("<a href='?page=" + i + "&size=" + pageSize + "&keyword="+ keyword + "' class='active'>" + i + "</a>");
			} else {
				out.println("<a href='?page=" + i + "&size=" + pageSize + "&keyword="+ keyword + "'>" + i + "</a>");
			}
		}
		if(currentPage!=pageList){
			out.println("<a href='?page="+(currentPage + 1) +"&size=" + pageSize + "&keyword="+ keyword + "'> ▶ </a>");
		}
		} catch (SQLException e) {
			out.println("DB오류");
		}
		
		
		%>
	</div>
	</div>
	<input hidden id="iniKey" value="<%=keyword %>">
	<input hidden id="pageSize" value="<%=pageSize %>">
	<input hidden id="currentPage" value="<%=currentPage %>">
</body>
</html>
<script>
	let pageSize = document.querySelector("#pageSize").value;
	let currentPage = document.querySelector("#currentPage").value;
	let number = document.querySelector("#number");
	let iniKey = document.querySelector("#iniKey").value;
	
	for(let i=0; i<number.length; i++){
		if(number[i].value == pageSize){
			number[i].selected = true;
		}
	}
	
	function fnNumber(num){        
        location.href = "?size=" + num + "&page=" + currentPage + "&keyword=" + iniKey;
	}
	
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href="?keyword="+keyword + "&size=" + pageSize + "&page=" + currentPage;	
	}
</script>