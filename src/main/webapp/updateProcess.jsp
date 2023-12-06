<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String custno = request.getParameter("custno");   //회원번호(id) 데이터
   String custname = request.getParameter("custname");
   String phone = request.getParameter("phone");
   String address = request.getParameter("address");
   String joindate = request.getParameter("joindate");
   String grade = request.getParameter("grade");
   String city = request.getParameter("city");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update member0828 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(7, custno);    
      pstmt.setString(1, custname);  
      pstmt.setString(2, phone);
      pstmt.setString(3, address);
      pstmt.setString(4, joindate);
      pstmt.setString(5, grade); 
      pstmt.setString(6, city); 
      
      pstmt.executeUpdate();
      %>
      <script>
       alert("회원정보 수정이 완료되었습니다!");
       location.href="select.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>
</body>
</html>