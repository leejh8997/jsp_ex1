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
	String selectSi = request.getParameter("selectSi");
	String selectGu = request.getParameter("selectGu");
	String selectDong = request.getParameter("selectDong");
	ResultSet rsSi =null;
	ResultSet rsGu =null;
	ResultSet rsDong =null;
	String qrySi = "SELECT DISTINCT SI FROM AREA";
	String qryGu = "SELECT DISTINCT GU FROM AREA WHERE SI = '"+selectSi+"' AND GU IS NOT NULL";
	String qryDong = "SELECT DISTINCT DONG, NX, NY FROM AREA WHERE SI = '"+selectSi+ "' AND GU = '"+selectGu+"' AND DONG IS NOT NULL";
	%>
	<div>
		시 : 
		<select id="SI" onchange="fnSelectSi(this.value)">
			<%		
			rsSi= stmt.executeQuery(qrySi);
			%>
				<option>:: 선택 ::</option>
			<%
			while(rsSi.next()){
				String si = rsSi.getString("SI");
				String selected = si.equals(selectSi) ? "selected" : "";
			%>
				<option  value="<%=si%>" <%= selected %>><%=si%></option>
			<%
			}
			 %>
		</select>
		 구 : 
		<select id="GU" onchange="fnSelectGu(this.value,'<%=selectSi%>')">
			<%		
			rsGu= stmt.executeQuery(qryGu);
			%>
				<option>:: 선택 ::</option>
			<%
			while(rsGu.next()){
				String gu = rsGu.getString("GU");
				String selected = gu.equals(selectGu) ? "selected" : "";
			%>
				<option value="<%=gu%>" <%= selected%>><%=gu%></option>
			<%
			}
			 %>
		</select>
		 동 :
		<select id="DONG" onchange="fnSelectDong(this.value)">
			<%		
			rsDong= stmt.executeQuery(qryDong);
			%>
				<option>:: 선택 ::</option>
			<%
			while(rsDong.next()){
				String dong = rsDong.getString("Dong");
				String selected = dong.equals(selectDong) ? "selected" : "";
			%>
				<option value="<%=dong%>" <%=selected %>><%=dong%></option>
			<%
			}
			 %>
		</select>
	</div>
<%-- 	<input hidden id="selectSi" value="<%=selectSi %>"> --%>
<%-- 	<input hidden id="selectGu" value="<%=selectGu %>"> --%>
<%-- 	<input hidden id="selectDong" value="<%=selectDong %>"> --%>
</body>
</html>
<script>
	function fnApiCall() {
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'NeMca8LnB2QZXZg33oQXeB57k5ehdiUxNjyBzPaMWnixI2RIvxfjH57Vq9lJhGXDLmFabkiEugBKMuDMrN3k5w%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '='
				+ encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '='
				+ encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '='
				+ encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '='
				+ encodeURIComponent('20250225'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '='
				+ encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('nx') + '='
				+ encodeURIComponent('55'); /**/
		queryParams += '&' + encodeURIComponent('ny') + '='
				+ encodeURIComponent('125'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				console.log('Status: ' + this.status + 'nHeaders: '
						+ JSON.stringify(this.getAllResponseHeaders())
						+ 'nBody: ' + this.responseText);
			}
		};

		xhr.send('');
	}
	
// 	let selectSi = document.querySelector("#selectSi").value;
// 	let SI = document.querySelector("#SI");
// 	for(let i=0; i<SI.length; i++){
// 		if(SI[i].value == selectSi){
// 			SI[i].selected = true;
// 		}
// 	}
// 	let selectGu = document.querySelector("#selectGu").value;
// 	let GU = document.querySelector("#GU");
// 	for(let i=0; i<GU.length; i++){
// 		if(GU[i].value == selectGu){
// 			GU[i].selected = true;
// 		}
// 	}
// 	let selectDong = document.querySelector("#selectDong").value;
// 	let DONG = document.querySelector("#DONG");
// 	for(let i=0; i<DONG.length; i++){
// 		if(DONG[i].value == selectDong){
// 			DONG[i].selected = true;
// 		}
// 	}
	function fnSelectSi(value){
		location.href = "?selectSi=" + value;
	}
	function fnSelectGu(GU,SI){		
		location.href = "?selectGu=" + GU + "&selectSi="+ SI;
	}
	function fnSelectDong(){
		let SI = document.querySelector("#SI").value;
		let GU = document.querySelector("#GU").value;
		let DONG = document.querySelector("#DONG").value;
		location.href = "?selectDong=" + DONG + "&selectGu=" + GU + "&selectSi="+ SI;
	}
</script>