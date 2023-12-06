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
   String custno = request.getParameter("custno");   //사원번호(id) 데이터
   String custname = request.getParameter("custname");
   String phone = request.getParameter("phone");
   String address = request.getParameter("address");
   String joindate = request.getParameter("joindate");
   String grade = request.getParameter("grade");
   String city = request.getParameter("city");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into member0828 values(?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, custno);    //첫번째 물음표에 id가 넘어감
      pstmt.setString(2, custname);  //두번째 물음표에 name이 넘어감
      pstmt.setString(3, phone);
      pstmt.setString(4, address);
      pstmt.setString(5, joindate);
      pstmt.setString(6, grade); 
      pstmt.setString(7, city); 
      
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("회원등록이 완료되었습니다!");
      location.href="select.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>