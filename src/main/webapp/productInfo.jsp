<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	frm.submit();
}
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>상품 등록 화면</h1>
<form name="frm" method="post" action="productInfoProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>상품코드</th>
      <td><input type="text" name="pcode" id=in1></td>
</tr>

<tr> 
      <th>상품명</th>
      <td><input type="text" name="pname" id=in1></td>
</tr>

<tr> 
      <th>단가</th>
      <td><input type="text" name="price" id=in1></td>
</tr>


<tr> 
      <th>재고수량</th>
      <td><input type="text" name="stockQty" id=in1></td>
</tr>



<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소" >
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>