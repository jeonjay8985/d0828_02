<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	if(document.frm.custno.value==""){
		alert("회원번호가 입력되지 않았습니다");
		document.frm.custno.focus(); //커서가 custno에 그대로 남아있도록 
		return false;            //회원번호를 입력하지 않으면 진행불가
	}
	if(document.frm.custname.value==""){
		alert("회원성명이 입력되지 않았습니다");
		document.frm.custname.focus(); 
		return false;  
	}
	if(document.frm.phone.value==""){
		alert("회원전화가 입력되지 않았습니다");
		document.frm.phone.focus(); 
		return false;  
	}
	if(document.frm.address.value==""){
		alert("회원주소가 입력되지 않았습니다");
		document.frm.address.focus(); 
		return false;  
	}
	if(document.frm.joindate.value==""){
		alert("가입일자가 입력되지 않았습니다");
		document.frm.joindate.focus(); 
		return false;  
	}

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>홈쇼핑 회원 등록</h1>
<form name="frm" method="post" action="insertProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>회원번호</th>
      <td><input type="text" name="custno" id=in></td>
</tr>

<tr> 
      <th>회원성명</th>
      <td><input type="text" name="custname" id=in></td>
</tr>

<tr> 
      <th>회원전화</th>
      <td><input type="text" name="phone" id=in></td>
</tr>


<tr> 
      <th>회원주소</th>
      <td><input type="text" name="address" id=in></td>
</tr>

<tr> 
      <th>가입일자</th>
      <td><input type="text" name="joindate" id=in></td>
</tr>

<tr> 
      <th>고객등급</th>
    <td>
      <select name = "grade" id=in>
      <option value ="A" selected>A: VIP</option>
      <option value ="B"> B: 일반</option>
      <option value ="C"> C: 직원</option>
      </select>
    </td>
</tr>

<tr> 
      <th>도시코드</th>
      <td>
      <select name = "city" id=in>
      <option value ="01" selected> 01:서울</option>
      <option value ="02"> 02:경기</option>
      <option value ="10"> 10:대전</option>
      <option value ="20"> 20:부산</option>
      <option value ="30"> 30:광주</option>
      <option value ="40"> 40:울산</option>
      <option value ="50"> 50:대구</option>
      <option value ="60"> 60:강원</option>
      <option value ="70"> 70:경상</option>
      <option value ="80"> 80:충청</option>
      <option value ="90"> 90:제주</option>

      </select>
    </td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="button" value="조회" onclick="newPage()">
      <script>
     function newPage()  {
	 location.href="select.jsp";
	}
    </script>
    
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>