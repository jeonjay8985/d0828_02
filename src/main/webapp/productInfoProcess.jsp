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
   String pcode = request.getParameter("pcode");       //상품코드
   System.out.println(pcode);
   String pname = request.getParameter("pname");       //상품명
   String price = request.getParameter("price");       //단가
   String stockQty = request.getParameter("stockQty"); //재고수량

   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into product0828 values(?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, pcode);    //첫번째 물음표에 상품코드가 넘어감
      pstmt.setString(2, pname);  //두번째 물음표에 상품명이 넘어감
      pstmt.setString(3, price);
      pstmt.setString(4, stockQty);

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("상품등록이 완료되었습니다!");
      location.href="salesInquiry.jsp";
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