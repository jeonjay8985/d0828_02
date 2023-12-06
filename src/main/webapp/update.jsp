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
	if(document.frm.grade.value==""){
		alert("고객등급이 입력되지 않았습니다");
		document.frm.grade.focus(); 
		return false;  
	}
	if(document.frm.city.value==""){
		alert("도시코드가 입력되지 않았습니다");
		document.frm.city.focus(); 
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
<h1>홈쇼핑 회원 정보 수정</h1>
<%@ include file = "dbconn.jsp" %>

<%
   String custno = request.getParameter("custno"); //select의 update.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select custname, phone, address, to_char(joindate, 'yyyy-mm-dd'), grade, city from member0828 where custno=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, custno);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String custname = rs.getString("custname");
		   String phone = rs.getString("phone");
		   String address = rs.getString("address");
		   String joindate = rs.getString(4);
		   String grade = rs.getString("grade");
		   String city = rs.getString("city");
		   if(city.equals("01")){
  			 city="서울";
  		   }
		   else if(city.equals("02")){
  		     city="경기";
  		   }
  		   else if(city.equals("10")){
  			 city="대전";
  		   }
  		   else if(city.equals("20")){
  			 city="부산";
  		   }
  		   else if(city.equals("30")){
  			 city="광주";
  		   }
  		   else if(city.equals("40")){
  			 city="울산";
  		   }
  		   else if(city.equals("50")){
  			 city="대구";
  		   }
  		   else if(city.equals("60")){
  			 city="강원";
  		   }
  		   else if(city.equals("70")){
  			 city="경상";
  		   }
  		   else if(city.equals("80")){
  			 city="충청";
  		   }
  		   else if(city.equals("90")){
  			 city="제주";
  		 }
%>

<form name="frm" method="post" action="updateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>회원번호</th>
      <td><input type="text" name="custno" id=in value="<%=custno%>"></td>
</tr>

<tr> 
      <th>회원성명</th>
      <td><input type="text" name="custname" id=in value="<%=custname%>"></td>
</tr>

<tr> 
      <th>회원전화</th>
      <td><input type="text" name="phone" id=in value="<%=phone%>"></td>
</tr>


<tr> 
      <th>회원주소</th>
      <td><input type="text" name="address" id=in value="<%=address%>"></td>
</tr>

<tr> 
      <th>가입일자</th>
      <td><input type="text" name="joindate" id=in value="<%=joindate%>"></td>
</tr>

<tr> 
      <th>고객등급[A:VIP, B:일반, C:직원]</th>
      <td>
      <select name = "grade" id=in>
      <option value ="A" <% if(grade.equals("A")){ %>selected <%}%>> A: VIP</option> 
      <option value ="B" <% if(grade.equals("B")){ %>selected <%}%>> B: 일반</option> 
      <option value ="C" <% if(grade.equals("C")){ %>selected <%}%>> C: 직원</option> 
      </select>
      </td>
      
</tr>

<tr> 
      <th>도시코드</th>
     <td>

      <select name = "city" id=in>
      <option value ="01" <% if(city.equals("서울")){ %>selected <%}%>> 01:서울</option>
      <option value ="02" <% if(city.equals("경기")){ %>selected <%}%>> 02:경기</option>
      <option value ="10" <% if(city.equals("대전")){ %>selected <%}%>> 10:대전</option>
      <option value ="20" <% if(city.equals("부산")){ %>selected <%}%>> 20:부산</option>
      <option value ="30" <% if(city.equals("광주")){ %>selected <%}%>> 30:광주</option>
      <option value ="40" <% if(city.equals("울산")){ %>selected <%}%>> 40:울산</option>
      <option value ="50" <% if(city.equals("대구")){ %>selected <%}%>> 50:대구</option>
      <option value ="60" <% if(city.equals("강원")){ %>selected <%}%>> 60:강원</option>
      <option value ="70" <% if(city.equals("경상")){ %>selected <%}%>> 70:경상</option>
      <option value ="80" <% if(city.equals("충청")){ %>selected <%}%>> 80:충청</option>
      <option value ="90" <% if(city.equals("제주")){ %>selected <%}%>> 90:제주</option>
            
      </select>
    </td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="button" value="조회" onclick="newPage()">
      <script>
     function newPage()  {
	 location.href="select.jsp";
	}
     </script>
    </td>
</tr>

</table>

<%
	   }
    }catch(Exception e){
 	  System.out.println("회원정보 수정 에러" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>