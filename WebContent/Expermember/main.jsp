<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>
</head>
<body>
<h2 class="w3-center" style="color:#D5D5D5">당신의 체중 바꿀 수 있습니다.</h2><br>
<h3 class="w3-center" style="color:#D5D5D5">당신의 식습관 바꿀 수 있습니다.</h3>

<div class="w3-content w3-section" style="max-width:500px">
  <img class="mySlides" src="img/main1.jpg" style="width:100%">
  <img class="mySlides" src="img/main2.jpg" style="width:100%">
  <img class="mySlides" src="img/main3.jpg" style="width:100%">
  <img class="mySlides" src="img/main4.jpg" style="width:100%">
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000); // 2초 마다 이미지 변경
}
</script>
</body>
</html>