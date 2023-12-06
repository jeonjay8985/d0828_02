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
<h1>회원 매출 집계 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>회원번호</th>
    <th>회원성명</th>
    <th>고객등급</th>
    <th>매출</th>
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
   
     int no =0;
     try{
    	 String sql = "select member0828.custno, custname, grade, sum(price) from money0828, member0828 where money0828.custno=member0828.custno group by member0828.custno, custname, grade order by sum(price) desc";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String custno = rs.getString(1);
    		 String custname = rs.getString(2);
    		 String grade = rs.getString(3);
    		 if(grade.equals("A")){
    			 grade="VIP";
      		   }
    		   else if(grade.equals("B")){
    			 grade="일반";
      		   }
      		   else if(grade.equals("C")){
      			 grade="직원";
      		   }
    		 int price = rs.getInt(4); //구 int amt ㅋㅋ
    		 no++;
    		 
%>
<tr>
    <td><%=no %> </td>
    <td><%=custno %></td>
    <td><%=custname %></td>
	<td><%=grade %></td>
    <td><%=price %> </td>
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