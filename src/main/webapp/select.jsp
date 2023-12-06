<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section> 
<%@ include file="dbconn.jsp" %>  
<h1>회원목록 조회/수정</h1>
<table border=1 id="tab1">
<tr>
    <th>회원번호</th>
    <th>회원성명</th>
    <th>전화번호</th>
    <th>주소</th>
    <th>가입일자</th>
    <th>고객등급</th>
    <th>거주지역</th>
</tr>
<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     //int no =0;
     //int id = rs.getInt("id");
     //no++;
     try{
    	 String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd'), grade, city from member0828";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String custno = rs.getString("custno");
    		 String custname = rs.getString("custname");
    		 String phone = rs.getString("phone");
    		 String address = rs.getString("address");
    		 String joindate = rs.getString(5);
    		 String grade = rs.getString("grade");
    		 String city = rs.getString("city");
    		 if(city.equals("01")){
    			 city="서울";
    		 }else if(city.equals("02")){
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
<tr>
    <td><a href = "update.jsp?custno=<%=custno %>"><%=custno %></a> </td>
    <td><%=custname %> </td>
    <td><%=phone %> </td>
    <td><%=address %> </td>
    <td><%=joindate %> </td>
    <td><%=grade %> </td>
    <td><%=city %> </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>
</table>

</section>
<%@ include file = "footer.jsp" %>
</body>
</html>