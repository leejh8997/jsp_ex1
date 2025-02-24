<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp"%>
	<!-- 학번, 이름, 학과, 성별 -->
	<!-- stu-join-result.jsp로 전달 -->
	<form action="stu-join-result.jsp" method="get" name="stu">
		<div>
			학번 : <input name="stuNo"> <input type="button" value="중복체크"
				onclick="fnCheck()">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			성별 : <input type="radio" name="stuGender" value="M" checked>남자
			<input type="radio" name="stuGender" value="F">여자
		</div>
		<div>
			<button onclick="fnStuInsert(); return false;">저장</button>
		</div>
	</form>
</body>
</html>
<script>
	let checkFlg = false;
	function fnStuInsert() {

		let stu = document.stu;
		if (!checkFlg) {
			alert("중복체크 하셈");
			return;
		}

		if (stu.stuNo.value.length != 8) {
			alert("학번은 8글자");
			return;
		}
		if (stu.stuName.value == "" || stu.stuDept.value == "") {
			alert("모든 값을 채워주세요");
			return;
		}
		stu.stuNo.disabled = false;
		stu.submit();
	}
	function fnCheck() {
		let stu = document.stu;
		if (stu.stuNo.value.length != 8) {
			alert("학번은 8글자");
			return;
		}
		window.open("id-check.jsp?stuNo=" + stu.stuNo.value, "check",
				"width=300, height=300");
		if (!popup || popup.closed || typeof popup.closed == 'undefined') {
			alert("팝업이 차단되었습니다. 팝업 차단 설정을 확인해주세요.");
		}
	}
	function getReturn(flg) {
		console.log(flg);
		let obj = document.stu.stuNo;
		if (flg === "N") {
			alert("사용 가능한 학번입니다.");
			checkFlg = true;
		} else {
			alert("이미 존재하는 학번입니다.");
			obj.value = "";
			obj.disabled = true;
		}
	}
</script>