<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ include file="../db.jsp" %>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="check">
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("학번이 중복되었습니다.");
	%>
			<input name="flg" value="Y" hidden>
	<%	
		} else {
			out.println("사용 가능한 학번입니다.");
	%>
			<input name="flg" value="N" hidden>
	<%
		}
	%>
	<div>
		<input type="button" value="되돌아가기" onclick="fnBack()">
	</div>
	</form>
</body>
</html>
<script>
function fnBack(){
	// 값을 부모 창에 전달
	window.opener.getReturn(document.check.flg.value);
	// 팝업 닫기
	window.close();
}

</script>