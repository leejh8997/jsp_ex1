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
	String sql = "SELECT COUNT(E.ENAME) AS cnt, E2.ENAME AS TNAME " + " FROM EMP E"
			+ " INNER JOIN EMP E2 ON E.MGR = E2.EMPNO" 
			+ " GROUP BY E2.ENAME ORDER BY cnt DESC";
	rs = stmt.executeQuery(sql);
	while (rs.next()) {
	%>
	<input class="tname" value="<%=rs.getString("TNAME")%>" hidden>
	<input class="cnt" value="<%=rs.getString("cnt")%>" hidden>
	<%
	}
	%>
	<div id="chart"></div>
	<div id="chart2"></div>
</body>
</html>
<script>
	let tname = document.querySelectorAll(".tname");
	let tnameList = [];
	let cnt = document.querySelectorAll(".cnt");
	let cntList = [];
	for (let i = 0; i < tname.length; i++) {
		tnameList.push(tname[i].value);
		cntList.push(parseInt(cnt[i].value));
	}
	console.log(cntList);
	console.log(tnameList);
	var options = {
		series : cntList,
		chart : {
			width : 380,
			type : 'pie',
		},
		labels : tnameList,
		responsive : [ {
			breakpoint : 480,
			options : {
				chart : {
					width : 200
				},
				legend : {
					position : 'bottom'
				}
			}
		} ]
	};
	var options2 = {
	          series: [{
	          name: 'Inflation',
	          data: cntList
	        }],
	          chart: {
	          height: 350,
	          type: 'bar',
	        },
	        plotOptions: {
	          bar: {
	            borderRadius: 10,
	            dataLabels: {
	              position: 'top', // top, center, bottom
	            },
	          }
	        },
	        dataLabels: {
	          enabled: true,
	          formatter: function (val) {
	            return val + "명";
	          },
	          offsetY: -20,
	          style: {
	            fontSize: '12px',
	            colors: ["#304758"]
	          }
	        },
	        
	        xaxis: {
	          categories: tnameList,
	          position: 'top',
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false
	          },
	          crosshairs: {
	            fill: {
	              type: 'gradient',
	              gradient: {
	                colorFrom: '#D8E3F0',
	                colorTo: '#BED1E6',
	                stops: [0, 100],
	                opacityFrom: 0.4,
	                opacityTo: 0.5,
	              }
	            }
	          },
	          tooltip: {
	            enabled: true,
	          }
	        },
	        yaxis: {
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false,
	          },
	          labels: {
	            show: false,
	            formatter: function (val) {
	              return val + "%";
	            }
	          }
	        
	        },
	        title: {
	          text: '부하직원 수',
	          floating: true,
	          offsetY: 330,
	          align: 'center',
	          style: {
	            color: '#444'
	          }
	        }
	        };

	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();
	var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
	chart2.render();
</script>
