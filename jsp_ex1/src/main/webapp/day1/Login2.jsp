<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- get방식은 주소에 데이터가 표시 됨-->
	<!-- post방식은 body에 데이터가 저장 됨-->
	<form action="Login-result.jsp" method="get" name="login">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<input type="button" value="로그인" onclick="fnLogin()"><!-- form태그 안에 있는 submit을 누르면 action 페이지로 이동 -->
	</form>
</body>
</html>
<script>
	function fnLogin(){
		let login = document.login;
		
		if(login.id.value == ""){
			alert("아이디를 입력해주세요!");
			login.id.focus();
			return;
		}
		if(login.pwd.value == ""){
			alert("비밀번호를 입력해주세요!");
			login.pwd.focus();
			return;
		}
		
		login.submit();
	}
</script>