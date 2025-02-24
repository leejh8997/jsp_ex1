<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String deptNo = request.getParameter("deptNo");
	String sql = "SELECT * FROM EMP WHERE DEPTNO = '" + deptNo + "'";
	rs = stmt.executeQuery(sql);
	while(rs.next()){
	%>
		<input class="ename" value="<%= rs.getString("ENAME") %>" hidden>
		<input class="sal" value="<%= rs.getString("SAL") %>" hidden>
	<%	
	}
	%>
	<div id="chart"></div>
</body>
</html>
<script>
	let ename = document.querySelectorAll(".ename");
	let enameList = [];
	let sal = document.querySelectorAll(".sal");
	let salList = [];
	for(let i=0; i<ename.length; i++){
		enameList.push(ename[i].value);
		salList.push(sal[i].value);
	}
	var options = {
		series : [ {
			data : salList,
			name : '월급'

		} ],
		title: {
            text: '급여차트',
            align: 'center'
        },
		chart : {
			type : 'bar',
			height : 350
		},
		plotOptions : {
			bar : {
				borderRadius : 4,
				borderRadiusApplication : 'end',
				horizontal : true,
			}
		},
		dataLabels : {
			enabled : false
		},
		xaxis : {
			categories : enameList,

		}
	};
	
	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();
</script>