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
<h1>회원 매출 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>회원번호</th>
    <th>판매번호</th>
    <th>단가</th>
    <th>수량</th>
    <th>가격</th>
    <th>상품코드</th>
    <th>판매일자</th>
    <th>구분</th>
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
   
     int no =0;
     try{
    	 String sql = "select member0828.custno, salenol, pcost, amount, price, pcode, to_char(sdate, 'yyyy-mm-dd') from money0828, member0828 where money0828.custno=member0828.custno group by member0828.custno, salenol, pcost, amount, price, pcode, to_char(sdate, 'yyyy-mm-dd') order by member0828.custno asc";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String custno = rs.getString(1);
    		 String salenol = rs.getString(2);
    		 String pcost = rs.getString(3);
    		 String amount = rs.getString(4);
    		 String price = rs.getString(5);
    		 String pcode = rs.getString(6);
    		 String sdate = rs.getString(7);
    		 no++;
    		 
%>
<tr>
    <td><%=no %> </td>
    <td><a href = "update.jsp?custno=<%=custno %>"><%=custno %></a> </td>
    <td><%=salenol %></td>
    <td><%=pcost %></td>
    <td><%=amount %></td>
    <td><%=price %></td>
    <td><%=pcode %></td>
	<td><%=sdate %></td>
	<td>
    <a href="productDelete.jsp?salenol=<%=salenol %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>

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