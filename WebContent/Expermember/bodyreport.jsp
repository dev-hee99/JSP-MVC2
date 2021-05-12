<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü���</title>
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
	   		alert("���� ����:" + e.status);
	   	}
	  })
   }
    function bodyfatgraph(){
 	   $.ajax("${path}/ajax/bodyfatgraph.do",{
 		   success : function(data){
 			   bodyfatGraphPrint(data);
 		   },
 	   	error : function(e){
 	   		alert("���� ����:" + e.status);
 	   	}
 	  })
    }
    function musclemassgraph(){
 	   $.ajax("${path}/ajax/musclegraph.do",{
 		   success : function(data){
 			   muscleGraphPrint(data);
 		   },
 	   	error : function(e){
 	   		alert("���� ����:" + e.status);
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
                 label: '������(kg)',
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
              			 text : '������ ��ȭ����',
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
                 label: 'ü�����(%)',
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
              			 text : 'ü����� ��ȭ����',
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
                 label: '��ݱٷ�(kg)',
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
              			 text : '��ݱٷ� ��ȭ����',
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

<div style="text-align:center; width:100%; padding-top:20px;"><p style="color:#747474;font-weight:bold">${sessionScope.name}���� ��ü���</p></div>
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
onclick="document.getElementById('bodyreport').style.display='block'" class="w3-button w3-green">����ϱ�</a></div>
<!-- ��ü��� -->

<div class="inner_list">
<c:if test="${list.size() > 0}">
<table class="w3-class">
<tr><th>��¥</th><th>ü��</th><th>ü�����</th><th colspan="2">��ݱٷ�</th><td colspan="1"></td></tr>
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
<div style="text-align:center;">��ü ��� ������ �����ϴ�.<p>����ϱ⸦ ���� ��ü������ ������ּ���. </p></div>
</c:if>
</div>

<div class="inner_comment">
<div>
<c:choose>
<c:when test="${mem.weight > mem.chgweight && mem.chgweight != 0}">
���� ������:${mem.weight}/�ֱ� ������:${mem.chgweight}<font style="color:green; font-weight:bold"> -${mem.weight-mem.chgweight}kg���� �ϼ̽��ϴ�.</font>
<p>���̾�Ʈ �� �� ��� - ���� ���ϰ� �ֽ��ϴ�!! �� ���� ü������� �ٿ�������  <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">�� �˾ƺ���</a></p>
<p>��ũ�� �� �� ��� - �����Ͻø� �ȵ˴ϴ�!! �����ϴµ� �����ϼž� �մϴ�.<br> ü�߰� ��ݱٷ��� �÷������� <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">�� �˾ƺ���</a></p>
</c:when>
<c:when test="${mem.weight < mem.chgweight && mem.chgweight != 0}">
���� ������&nbsp;:&nbsp;${mem.weight}/�ֱ� ������&nbsp;:&nbsp;${mem.chgweight}&nbsp;<font style="color:red; font-weight:bold"> +${mem.weight-mem.chgweight}kg���� �ϼ̽��ϴ�.</font>
<p>���̾�Ʈ �� �� ��� - ���̻��� ü���� ������ �ȵ˴ϴ�!! (��õ �: �ȱ�,�ٱ�,������,����,���,�÷�ũ ��)   <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">�� �˾ƺ���</a></p>
<p>��ũ�� �� �� ��� - ���� ���ϰ� �ֽ��ϴ�!! ������ �����ϼ���. <a href="exercisetip.do" style="font-size:11px; color:navy; font-weight:bold">�� �˾ƺ���</a></p>
</c:when>
<c:otherwise>��ü����� ��ϵ� �� ���ų� ������ ��ȭ�� �����ϴ�.</c:otherwise>
</c:choose>
<br>
<div style="background-color:white; width:650px;text-align:center; border-radius:50px;"><font style="color:red; font-weight:bold">��ü����� �Է� �ϼ̴ٸ� ���� ��� �غ��� ���ϵ� �ۼ��غ�����.</font></div>
</div>
</div>



</div>
<!-- ����ϱ� -->
	<div id="bodyreport" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 400px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('bodyreport').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="â �ݱ�">&times;</span>
			</div>
			<form class="w3-container" action="report.do" method="post">
				<div class="w3-section">
					<table>
					<caption>
					<font style="color:navy; font-weight:bold">
					���ʱ��:
					<c:if test="${mindate!=null}">
					${mindate}/
					�ֱٱ��:				
					${maxdate}
					</c:if>
					<c:if test="${mindate==null}">
					����/�ֱٱ��:����			
					</c:if>
					</font>
					</caption>
					<tr><td><b>��¥</b></td><td><input class="w3-date" name="date" id="now_date" type="date"></td></tr>
					<tr><td><b>ü��</b></td><td><input class="w3-input w3-border w3-light-grey"
					 name="weight" style="text-align:right" type="text" placeholder="ü���� �Է����ּ���" 
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td></tr>
					 
					<tr><td><b>ü�����</b></td><td><input class="w3-input w3-border w3-light-grey"
					 name="bodyfat" style="text-align:right" type="text" placeholder="ü������� �Է����ּ���"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td></tr>
					 
					<tr><td><b>��ݱٷ�</b></td><td><input class="w3-input w3-border w3-light-grey" 
					name="musclemass" style="text-align:right" type="text" placeholder="��ݱٷ��� �Է����ּ���"
					 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td></tr>
					
					</table>
					<button class="w3-button w3-block w3-green w3-section w3-padding"
						type="submit">�������</button>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
document.getElementById('now_date').valueAsDate = new Date();
</script>
</body>
</html>