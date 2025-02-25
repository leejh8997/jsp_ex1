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
	<form action="sample-stuInsert-result.jsp" name="stu">
		<div>
			학번 : <input name="stuId">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			과목 : <input name="subject">
		</div>
		<div>
			점수 : <input name="grade">
		</div>
		<div>
			<input type="button" onclick="fnStuInsert1()" value="학생추가">
		</div>
	</form>
</body>
</html>
<script>
	function fnStuInsert1(){
		let stuId = document.stu.stuId.value;
		let stuName = document.stu.stuName.value;
		let stuDept = document.stu.stuDept.value;
		let subject = document.stu.subject.value;
		let grade = document.stu.grade.value;
		console.log(stuId);
		
		if(stu.stuId.value.length != 4){
			alert("학번은 4글자입니다.");
			return;
		}
		if(grade<0 || grade>100){
			alert("점수는 1~100 사이 값 입력하세요.");
			return;
		}
		if(stuId=="" || stuName=="" || stuDept=="" || subject=="" || grade==""){
			alert("모든 항목을 채워주세요.");
			return;
		}
		alert("저장되었습니다.");
		stu.submit();
	}
</script>