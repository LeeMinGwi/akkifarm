<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*"
import = "java.text.DecimalFormat" %>
<html>
<title>회원정보</title>
<body>
<%@ include file="./menu.jsp" %>
<table align="center" width=800>
<tr height="100"><td></td></tr>
<tr height="20">
<td colspan=3><b><font size="5">● 회원정보</b></font></td>
<%
DecimalFormat comma = new DecimalFormat("###,###");
try {
	String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	Connection conn = DriverManager.getConnection(url, "test1", "1234");

	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM 회원 WHERE ID=\'"+currentID+"\'");
	if(rs.next()) {
		String memberID = rs.getString("ID");
		String memberName = rs.getString("이름");
		String memberPhone = rs.getString("연락처");
		String memberAddr = rs.getString("주소");
		String memberBirth = rs.getString("생년월일"); 
	%>
<tr height=50><td width = 160>ID</td><td>
		<%out.print(memberID);%></td></tr>
<tr height=50><td width = 160>이름</td><td>
		<%out.print(memberName);%></td></tr>
<tr height=50><td width = 160>생년월일</td><td>
		<%out.print(memberBirth);%></td></tr>
<tr height=50><td width = 160>연락처</td><td>
		<%out.print(memberPhone);%></td></tr>
<tr height=50><td width = 160>주소</td><td>
		<%out.print(memberAddr);%></td></tr>
	<%}%>
<table align="center" width=800>
<tr height=50><td width=400 align="center"><a href="./quitprocess.jsp">회원탈퇴</a></td>
<td width=400 align="center"><a href="./updateinfo.jsp">정보수정</a></td></tr>
</table>
<table align="center" width=800>
<tr height="100"><td></td></tr>
<tr height="20">
<td colspan=3><b><font size="5">● 주문내역</b></font></td>
<tr height=50><td width=300>상품명</td><td width=400>배송지</td><td width=100>가격</td>
<%
	rs = stmt.executeQuery("SELECT * FROM 주문 NATURAL JOIN 상품 WHERE ID=\'"+currentID+"\'");
	String address;
	String goodname;
	String price;
	while(rs.next()) {
		address=rs.getString("배송주소");
		goodname=rs.getString("상품명");
		price=comma.format(rs.getInt("가격"));
		out.print("<tr height=60><td width=300>"+goodname+"</td>");
		out.print("<td width=400>"+address+"</td>");
		out.print("<td width=100>"+price+"원</td></tr>");
	}
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {}
%></table>
</body>
</html>