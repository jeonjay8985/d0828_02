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
    <th>상품코드</th>
    <th>상품명</th>
    <th>매출</th>
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
   
     int no =0;
     try{
    	 String sql = "select a.pcode, pname, sum(a.price) from product0828 b, money0828 a where a.pcode=b.pcode group by a.pcode, pname order by a.pcode";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String pcode = rs.getString(1);
    		 String pname = rs.getString(2);
    		 int price= rs.getInt(3);
    		 no++;
    		 
%>
<tr>
    <td><%=no %> </td>
    <td><%=pcode %></td>
    <td><%=pname %></td>
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