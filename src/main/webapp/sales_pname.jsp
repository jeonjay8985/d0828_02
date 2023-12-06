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
    <th>회원이름</th>
    <th>판매번호</th>
    <th>단가</th>
    <th>수량</th>
    <th>가격</th>
    <th>상품코드</th>
    <th>상품명</th>
    <th>판매일자</th>

</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
   
     int no =0;
     String pname=null;
     try{
    	 String sql = "select a.custno, a.custname, b.salenol, b.pcost, b.amount, b.price, b.pcode, to_char(sdate, 'yyyy-mm-dd') from member0828 a, money0828 b where a.custno=b.custno order by b.pcode";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String custno = rs.getString(1);
    		 String custname = rs.getString(2);
    		 String salenol = rs.getString(3);
    		 String pcost = rs.getString(4);
    		 String amount = rs.getString(5);
    		 String price = rs.getString(6);
    		 String pcode = rs.getString(7);
    		
    		   if(pcode.equals("A001")){
    			     pname="볼펜";
      		   }
    		   else if(pcode.equals("A002")){
    			     pname="노트1";
      		   }  
      		   else if(pcode.equals("A003")){
      			     pname="노트2";
      		   }
      		   else if(pcode.equals("A004")){
        			 pname="색연필";
        		   }
      		   else if(pcode.equals("A005")){
        			 pname="지우개";
        		   }
      		   else if(pcode.equals("A006")){
        			 pname="연필";
        		   }
      		   else if(pcode.equals("A007")){
        			 pname="커터칼";
        		   }
      		   else if(pcode.equals("A008")){
        			 pname="견출지";
        		   }
      		   else if(pcode.equals("A009")){
        			 pname="테이프";
        		   }
      		   else if(pcode.equals("A010")){
        			 pname="수정펜";
        		   }
    		 
    		 String sdate = rs.getString(8);
    		 no++;
    		 
%>
<tr>
    <td><%=no %> </td>
    <td><%=custno %> </td>
    <td><%=custname %> </td>
    <td><%=salenol %></td>
    <td><%=pcost %></td>
    <td><%=amount %></td>
    <td><%=price %></td>
    <td><%=pcode %></td>
    <td><%=pname %></td>
	<td><%=sdate %></td>

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