<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>신체기록</title>
<style>
 .outter{
 	width:1500px;
 	height:1600px;
 	margin-left:100px;
 }
 .inner_graph{	
 	width:430px;
 	height:300px;
 	margin-left:50px;

 	margin-top:30px;
 	display:inline-block;
 }
 .inner_list{
 	width:650px;
 	height:450px;
 	margin-left:50px;
	background-color:#EAEAEA;
 	margin-top:30px;
 	display:inline-block;
 	overflow:auto;
 }
  .inner_comment{
 	width:650px;
 	height:450px;
 	margin-left:50px;
 	margin-top:30px;
	background-color:#EAEAEA;
 	display:inline-block;
 	vertical-align :top;
 	overflow:auto;
 }
 .line{
 	height:3px;
 	background-color:black;
 }
 tr td{
 	width:30%;
 	text-align:center;
 	padding-top:10px;
 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript">
    
    $(function(){
        weightgraph();
        bodyfatgraph();
        musclemassgraph();
     })
     
       function weightgraph(){
	   $.ajax("${path}/ajax/weightgraph.do",{
		   success : function(data){
			   weightGraphPrint(data);
		   },
	   	error : function(e){
	   		alert("서버 오류:" + e.status);
	   	}
	  })
   }
    function bodyfatgraph(){
 	   $.ajax("${path}/ajax/bodyfatgraph.do",{
 		   success : function(data){
 			   bodyfatGraphPrint(data);
 		   },
 	   	error : function(e){
 	   		alert("서버 오류:" + e.status);
 	   	}
 	  })
    }
    function musclemassgraph(){
 	   $.ajax("${path}/ajax/musclegraph.do",{
 		   success : function(data){
 			   muscleGraphPrint(data);
 		   },
 	   	error : function(e){
 	   		alert("서버 오류:" + e.status);
 	   	}
 	  })
    }
   
    function weightGraphPrint(data){
        var rows = JSON.parse(data);
        var regdates = [] //[2020-12-04,2020-12-07]
        var datas = []
        $.each(rows,function(index,item){
           regdates[index] = item.regdate;
           datas[index] = item.weight;
        })
        var chartData= {
           labels: regdates,
              datasets : [{
                 type : 'line',
                 borderColor:'navy',
                 borderWidth: 2,
                 pointBorderWidth: 2,
                 label: '몸무게(kg)',
                 fill : false,
                 data: datas
              }]
           }
           var config ={
              type : 'line',
              data : chartData,
              options: {
              	responsive : true,
              	title : {display : true,
              			 text : '몸무게 변화추이',
              			 position : 'bottom'
              	},
              	legend : {display : false},
              	scales: {
              		xAxes: [{
              			display : true, 
              			stacked : true
              			}],
              		yAxes: [{
              			display : true, 
              			stacked : true,
              			ticks:{
              				min: datas[0]-5,
              				stepSize: 1
              			}
              		}],
              		
              }
           }
        }
    var ctx = document.getElementById("weightchart").getContext("2d");
    new Chart(ctx,config);
 }
    
    function bodyfatGraphPrint(data){
        var rows = JSON.parse(data);
        var regdates = [] 
        var datas = []
        $.each(rows,function(index,item){
           regdates[index] = item.regdate;
           datas[index] = item.bodyfat;
        })
        var chartData= {
           labels: regdates,
              datasets : [{
                 type : 'line',
                 borderColor:'navy',
                 label: '체지방률(%)',
                 borderWidth: 2,
                 fill : false,
                 data: datas
              }]
           }
           var config ={
              type : 'line',
              data : chartData,
              options: {
              	responsive : true,
              	title : {display : true,
              			 text : '체지방률 변화추이',
              			 position : 'bottom'
              	},
              	legend : {display : false},
              	scales: {
              		xAxes: [{display : true, stacked : true}],
              		yAxes: [{
              				display : true,
              				stacked : true,
              				ticks:{
                  				min: datas[0]-5,
                  				stepSize: 2
                  			}
              			
              			}],
              		
              }
           }
        }
    var ctx = document.getElementById("bodyfatchart").getContext("2d");
    new Chart(ctx,config);
 }
    
    function muscleGraphPrint(data){
        var rows = JSON.parse(data);
        var regdates = []
        var datas = []
        $.each(rows,function(index,item){
           regdates[index] = item.regdate;
           datas[index] = item.musclemass;
        })
        var chartData= {
           labels: regdates,
              datasets : [{
                 type : 'line',
                 borderColor:'navy',
                 borderWidth: 2,
                 label: '골격근량(kg)',
                 fill : false,
                 data: datas
              }]
           }
           var config ={
              type : 'line',
              data : chartData,
              options: {
              	responsive : true,
              	title : {display : true,
              			 text : '골격근량 변화추이',
              			 position : 'bottom'
              	},
              	legend : {display : false},
              	scales: {
              		xAxes: [{display : true, stacked : true}],
              		yAxes: [{
              			display : true, 
              			stacked : true,
              			ticks:{
              				min: Math.floor(datas[0]-5),
              				stepSize: 1
              			}           			
              		}],
              		
              }
           }
        }
    var ctx = document.getElementById("musclechart").getContext("2d");
    new Chart(ctx,config);
 }
    
    
    </script>
</head>
<body>
<div class="outter">

<div style="text-align:center; width:100%; padding-top:20px;"><p style="color:#747474;font-weight:bold">${sessionScope.name}님의 신체기록</p></div>
<div class="inner_graph" id="weight_chart">
<canvas id="weightchart" style="width:100%; height:100%"></canvas>
</div>
<div class="inner_graph" id="bodyfat_chart">
<canvas id="bodyfatchart" style="width:100%; height:100%"></canvas>
</div>

<div class="inner_graph" id="muscle_chart">
<canvas id="musclechart" style="width:100%; height:100%"></canvas>
</div>

<div style="text-align:center"><a href="javascript:void(0);" 
onclick="document.getElementById('bodyreport').style.display='block'" class="w3-button w3-green">기록하기</a></div>
<!-- 신체기록 -->

<div class="inner_list">
<c:if test="${list.size() > 0}">
<table class="w3-class">
<tr><th>날짜</th><th>체중</th><th>체지방률</th><th colspan="2">골격근량</th><td colspan="1"></td></tr>
<c:forEach var="w" items="${list}">
<tr><td>
<fmt:formatDate var="regdate" value="${w.regdate}" type="DATE" pattern="yyyy-MM-dd"/>
${regdate}
</td>
<td>${w.weight}kg</td><td>${w.bodyfat}%</td><td>${w.musclemass}kg</td>
<td colspan="2"><a href="reportdelete.do?regdate=${regdate}" class="w3-button" style="text-color:grey" ><i class="fa fa-remove"></i></a></td></tr>
</c:forEach>
</table>
</c:if>
<c:if test="${list.size() < 1}">
<div style="text-align:center;">신체 기록 정보가 없습니다.<p>기록하기를 눌러 신체정보를 기록해주세요. </p></div>
</c:if>
</div>

<div class="inner_comment">
<div>
<c:choose>
<c:when test="${mem.weight > mem.chgweight && mem.chgweight != 0}">
최초 몸무게:${mem.weight}/최근 몸무게:${mem.chgweight}<font style="color:green; font-weight:bold"> -${mem.weight-mem.chgweight}kg감량 하셨습니다.</font>
<p>다이어트 중 인 경우 - 정말 잘하고 있습니다!! 더 많은 체지방률을 줄여보세요  <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">더 알아보기</a></p>
<p>벌크업 중 인 경우 - 감량하시면 안됩니다!! 증량하는데 집중하셔야 합니다.<br> 체중과 골격근량을 늘려보세요 <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">더 알아보기</a></p>
</c:when>
<c:when test="${mem.weight < mem.chgweight && mem.chgweight != 0}">
최초 몸무게&nbsp;:&nbsp;${mem.weight}/최근 몸무게&nbsp;:&nbsp;${mem.chgweight}&nbsp;<font style="color:red; font-weight:bold"> +${mem.weight-mem.chgweight}kg증량 하셨습니다.</font>
<p>다이어트 중 인 경우 - 더이상의 체지방 증가는 안됩니다!! (추천 운동: 걷기,뛰기,자전거,수영,등산,플랭크 등)   <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">더 알아보기</a></p>
<p>벌크업 중 인 경우 - 정말 잘하고 있습니다!! 증량에 집중하세요. <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">더 알아보기</a></p>
</c:when>
<c:otherwise>신체기록이 기록된 게 없거나 아직은 변화가 없습니다.</c:otherwise>
</c:choose>
<br>
<div style="background-color:white; width:650px;text-align:center; border-radius:50px;"><font style="color:red; font-weight:bold">신체기록을 입력 하셨다면 직접 운동을 해보고 운동기록도 작성해보세요.</font></div>
</div>
</div>



</div>
<!-- 기록하기 -->
	<div id="bodyreport" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('bodyreport').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="창 닫기">&times;</span>
			</div>
			<form class="w3-container" action="report.do" method="post">
				<div class="w3-section">
					<table>
					<caption>
					<font style="color:navy; font-weight:bold">
					최초기록:
					<c:if test="${mindate!=null}">
					${mindate}/
					최근기록:				
					${maxdate}
					</c:if>
					<c:if test="${mindate==null}">
					없음/최근기록:없음			
					</c:if>
					</font>
					</caption>
					<tr><td><b>날짜</b></td><td><input class="w3-date" name="date" id="now_date" type="date"></td></tr>
					<tr><td><b>체중</b></td><td><input class="w3-input w3-border w3-light-grey"
					 name="weight" style="text-align:right" type="text" placeholder="체중을 입력해주세요" 
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td></tr>
					 
					<tr><td><b>체지방률</b></td><td><input class="w3-input w3-border w3-light-grey"
					 name="bodyfat" style="text-align:right" type="text" placeholder="체지방률을 입력해주세요"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td></tr>
					 
					<tr><td><b>골격근량</b></td><td><input class="w3-input w3-border w3-light-grey" 
					name="musclemass" style="text-align:right" type="text" placeholder="골격근량을 입력해주세요"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td></tr>
					
					</table>
					<button class="w3-button w3-block w3-green w3-section w3-padding"
						type="submit">기록저장</button>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
document.getElementById('now_date').valueAsDate = new Date();
</script>
</body>
</html>